module ReservationsHelper
  def calendar(bike, date = Date.today, &block)
    Calendar.new(self, bike, date, block).table
  end
  # calendar helper method defined here

  class Calendar < Struct.new(:view, :bike, :date, :callback)
    HEADER = %w[sun mon tues wed thurs fri sat]
    START_DAY = :sunday

    # struct is defining accessors for attributes

    delegate :content_tag, to: :view

    # delegating to view for any helper methods that can be accessed in the calendar

    def table
      content_tag :table, class: "calendar" do
        header + week_rows
      end
    end

    # creates html for table

    def header
      content_tag :tr do
        HEADER.map { |day| content_tag :th, day }.join.html_safe
      end
    end

    # maps days of the week into header row

    def week_rows
      weeks.map do |week|
        content_tag :tr do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    # generates week and renders day cell

    def day_cell(day)
      content_tag :td, view.capture(day, &callback), class: day_classes(day)
    end

    # captures block passed in through calendar helper method

    def day_classes(day)
      classes = []
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes << "booked" if bike.booked_for?(day)
      classes.empty? ? nil : classes.join(" ")
    end

    # CSS classes for styling

    # rails helper methods for defining current day and sorting weeks into 7 days

    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
  end
end
