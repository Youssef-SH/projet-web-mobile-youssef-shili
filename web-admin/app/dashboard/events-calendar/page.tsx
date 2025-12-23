"use client";

import React, { JSX } from "react";
import { useState } from "react";
import {
  ChevronLeft,
  ChevronRight,
  Clock,
  MapPin,
  Users,
  Plus,
  Filter,
  Calendar,
} from "lucide-react";

/* --- Types --- */
interface EventItem {
  id: number;
  title: string;
  club: string;
  time: string;
  location: string;
  color: string;
  attendees: number;
}

type ViewMode = "month" | "list";

interface DaysInMonthInfo {
  daysInMonth: number;
  startingDayOfWeek: number;
}

/* --- Component --- */
export default function AdminEventsCalendar(): JSX.Element {
  const [currentDate, setCurrentDate] = useState<Date>(new Date());
  const [selectedDate, setSelectedDate] = useState<Date>(new Date());
  const [viewMode, setViewMode] = useState<ViewMode>("month");

  // Sample events data (keys must match format used in formatDate)
  const events: Record<string, EventItem[]> = {
    "2025-10-25": [
      {
        id: 1,
        title: "Web Development Workshop",
        club: "ARSII",
        time: "2:00 PM - 4:00 PM",
        location: "C-11",
        color: "#3B82F6",
        attendees: 45,
      },
      {
        id: 2,
        title: "Team Meeting",
        club: "CPU",
        time: "5:00 PM - 6:00 PM",
        location: "Amphi Kanoun",
        color: "#8B5CF6",
        attendees: 12,
      },
    ],
    "2025-10-26": [
      {
        id: 3,
        title: "Hackathon",
        club: "ISIMM",
        time: "9:00 AM - 5:00 PM",
        location: "Main Hall",
        color: "#F97316",
        attendees: 120,
      },
    ],
    // Note: prefer '2025-11-08' (two-digit day) to match formatDate output
    "2025-11-08": [
      {
        id: 4,
        title: "Public Speaking Workshop",
        club: "Debate Club",
        time: "3:00 PM - 5:00 PM",
        location: "Room 205",
        color: "#10B981",
        attendees: 30,
      },
    ],
  };

  const getDaysInMonth = (date: Date): DaysInMonthInfo => {
    const year = date.getFullYear();
    const month = date.getMonth();
    const firstDay = new Date(year, month, 1);
    const lastDay = new Date(year, month + 1, 0);
    const daysInMonth = lastDay.getDate();
    const startingDayOfWeek = firstDay.getDay(); // 0 (Sun) .. 6 (Sat)

    return { daysInMonth, startingDayOfWeek };
  };

  const formatDate = (date: Date): string => {
    const yyyy = date.getFullYear();
    const mm = String(date.getMonth() + 1).padStart(2, "0");
    const dd = String(date.getDate()).padStart(2, "0");
    return `${yyyy}-${mm}-${dd}`;
  };

  const getEventsForDate = (date: Date): EventItem[] => {
    const dateStr = formatDate(date);
    return events[dateStr] ?? [];
  };

  const previousMonth = (): void => {
    setCurrentDate(
      new Date(currentDate.getFullYear(), currentDate.getMonth() - 1, 1)
    );
  };

  const nextMonth = (): void => {
    setCurrentDate(
      new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 1)
    );
  };

  const isToday = (date: Date): boolean => {
    const today = new Date();
    return (
      date.getDate() === today.getDate() &&
      date.getMonth() === today.getMonth() &&
      date.getFullYear() === today.getFullYear()
    );
  };

  const isSameDay = (date1: Date, date2: Date): boolean => {
    return (
      date1.getDate() === date2.getDate() &&
      date1.getMonth() === date2.getMonth() &&
      date1.getFullYear() === date2.getFullYear()
    );
  };

  const renderCalendar = (): React.ReactNode[] => {
    const { daysInMonth, startingDayOfWeek } = getDaysInMonth(currentDate);
    const days: React.ReactNode[] = [];
    const monthStart = startingDayOfWeek === 0 ? 6 : startingDayOfWeek - 1;

    // Empty cells for days before month starts
    for (let i = 0; i < monthStart; i++) {
      days.push(
        <div
          key={`empty-${i}`}
          className="h-32 bg-gray-50 border border-gray-200"
        />
      );
    }

    // Days of the month
    for (let day = 1; day <= daysInMonth; day++) {
      const date = new Date(
        currentDate.getFullYear(),
        currentDate.getMonth(),
        day
      );
      const dayEvents = getEventsForDate(date);
      const isSelected = isSameDay(date, selectedDate);
      const isTodayDate = isToday(date);

      days.push(
        <div
          key={day}
          onClick={() => setSelectedDate(date)}
          className={`h-32 border border-gray-200 p-2 cursor-pointer transition-all hover:bg-gray-50 ${
            isSelected ? "ring-2 ring-blue-500 bg-blue-50" : "bg-white"
          }`}
        >
          <div className="flex items-center justify-between mb-2">
            <span
              className={`text-sm font-semibold ${
                isTodayDate
                  ? "w-7 h-7 rounded-full bg-gradient-to-r from-amber-400 to-orange-500 text-white flex items-center justify-center"
                  : isSelected
                  ? "text-blue-600"
                  : "text-gray-700"
              }`}
            >
              {day}
            </span>
            {dayEvents.length > 0 && (
              <span className="text-xs font-medium text-gray-500 bg-gray-100 px-2 py-0.5 rounded-full">
                {dayEvents.length}
              </span>
            )}
          </div>
          <div className="space-y-1">
            {dayEvents.slice(0, 2).map((event) => (
              <div
                key={event.id}
                className="text-xs p-1.5 rounded truncate"
                style={{
                  backgroundColor: `${event.color}15`,
                  borderLeft: `3px solid ${event.color}`,
                }}
              >
                <div className="font-medium text-gray-800 truncate">
                  {event.title}
                </div>
                <div className="text-gray-600 text-[10px]">
                  {event.time.split(" - ")[0]}
                </div>
              </div>
            ))}
            {dayEvents.length > 2 && (
              <div className="text-xs text-gray-500 font-medium pl-1">
                +{dayEvents.length - 2} more
              </div>
            )}
          </div>
        </div>
      );
    }

    return days;
  };

  const renderEventsList = (): JSX.Element => {
    const selectedEvents = getEventsForDate(selectedDate);

    return (
      <div className="bg-white rounded-xl border border-gray-200 p-6">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h3 className="text-xl font-bold text-gray-900">
              {selectedDate.toLocaleDateString("en-US", {
                weekday: "long",
                month: "long",
                day: "numeric",
                year: "numeric",
              })}
            </h3>
            <p className="text-sm text-gray-500 mt-1">
              {selectedEvents.length}{" "}
              {selectedEvents.length === 1 ? "event" : "events"} scheduled
            </p>
          </div>
        </div>

        {selectedEvents.length === 0 ? (
          <div className="text-center py-12">
            <div className="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <Calendar className="w-8 h-8 text-gray-400" />
            </div>
            <h4 className="text-lg font-semibold text-gray-900 mb-2">
              No events scheduled
            </h4>
            <p className="text-gray-500">There are no events on this date.</p>
          </div>
        ) : (
          <div className="space-y-4">
            {selectedEvents.map((event) => (
              <div
                key={event.id}
                className="border border-gray-200 rounded-xl p-5 hover:shadow-md transition-all group"
              >
                <div className="flex items-start gap-4">
                  <div
                    className="w-1.5 h-full rounded-full mt-1"
                    style={{ backgroundColor: event.color, minHeight: "80px" }}
                  />
                  <div className="flex-1">
                    <div className="flex items-start justify-between mb-3">
                      <div>
                        <div className="flex items-center gap-2 mb-2">
                          <span
                            className="px-3 py-1 rounded-full text-xs font-semibold"
                            style={{
                              backgroundColor: `${event.color}20`,
                              color: event.color,
                            }}
                          >
                            {event.club}
                          </span>
                        </div>
                        <h4 className="text-lg font-bold text-gray-900 mb-2">
                          {event.title}
                        </h4>
                      </div>
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-3 gap-3 text-sm">
                      <div className="flex items-center gap-2 text-gray-600">
                        <Clock className="w-4 h-4 text-gray-400" />
                        <span>{event.time}</span>
                      </div>
                      <div className="flex items-center gap-2 text-gray-600">
                        <MapPin className="w-4 h-4 text-gray-400" />
                        <span>{event.location}</span>
                      </div>
                      <div className="flex items-center gap-2 text-gray-600">
                        <Users className="w-4 h-4 text-gray-400" />
                        <span>{event.attendees} attendees</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    );
  };

  const renderListView = (): JSX.Element => {
    const allEvents: { date: Date; events: EventItem[] }[] = [];

    Object.entries(events).forEach(([dateStr, dayEvents]) => {
      const [year, month, day] = dateStr.split("-").map(Number);
      const date = new Date(year, month - 1, day);
      if (
        date >=
          new Date(currentDate.getFullYear(), currentDate.getMonth(), 1) &&
        date <=
          new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0)
      ) {
        allEvents.push({ date, events: dayEvents });
      }
    });

    allEvents.sort((a, b) => a.date.getTime() - b.date.getTime());

    return (
      <div className="space-y-6">
        {allEvents.map(({ date, events: dayEvents }) => (
          <div key={formatDate(date)}>
            <div className="flex items-center gap-3 mb-4">
              <div className="px-4 py-2 bg-gradient-to-r from-amber-400 to-orange-500 rounded-lg">
                <div className="text-white font-bold text-lg">
                  {date.getDate()}
                </div>
              </div>
              <div>
                <div className="font-semibold text-gray-900">
                  {date.toLocaleDateString("en-US", { weekday: "long" })}
                </div>
                <div className="text-sm text-gray-500">
                  {date.toLocaleDateString("en-US", {
                    month: "long",
                    year: "numeric",
                  })}
                </div>
              </div>
            </div>
            <div className="space-y-3">
              {dayEvents.map((event) => (
                <div
                  key={event.id}
                  className="border border-gray-200 rounded-xl p-4 hover:shadow-md transition-all bg-white"
                >
                  <div className="flex items-start gap-3">
                    <div
                      className="w-1 h-full rounded-full"
                      style={{
                        backgroundColor: event.color,
                        minHeight: "60px",
                      }}
                    />
                    <div className="flex-1">
                      <div className="flex items-center gap-2 mb-2">
                        <span
                          className="px-2.5 py-0.5 rounded-full text-xs font-semibold"
                          style={{
                            backgroundColor: `${event.color}20`,
                            color: event.color,
                          }}
                        >
                          {event.club}
                        </span>
                      </div>
                      <h4 className="font-bold text-gray-900 mb-2">
                        {event.title}
                      </h4>
                      <div className="flex flex-wrap gap-4 text-sm text-gray-600">
                        <div className="flex items-center gap-1.5">
                          <Clock className="w-4 h-4" />
                          <span>{event.time}</span>
                        </div>
                        <div className="flex items-center gap-1.5">
                          <MapPin className="w-4 h-4" />
                          <span>{event.location}</span>
                        </div>
                        <div className="flex items-center gap-1.5">
                          <Users className="w-4 h-4" />
                          <span>{event.attendees} attendees</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    );
  };

  const monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  const weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="bg-white rounded-xl border border-gray-200 p-6 mb-6 shadow-sm">
          <div className="flex items-center justify-between mb-4">
            <div>
              <h1 className="text-3xl font-bold text-gray-900 mb-2">
                Events Calendar
              </h1>
              <p className="text-gray-500">Manage and view events</p>
            </div>
          </div>

          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <button
                onClick={previousMonth}
                className="p-2 hover:bg-gray-100 rounded-lg transition-all"
              >
                <ChevronLeft className="w-5 h-5 text-gray-600" />
              </button>
              <h2 className="text-xl font-bold text-gray-900 min-w-[200px] text-center">
                {monthNames[currentDate.getMonth()]} {currentDate.getFullYear()}
              </h2>
              <button
                onClick={nextMonth}
                className="p-2 hover:bg-gray-100 rounded-lg transition-all"
              >
                <ChevronRight className="w-5 h-5 text-gray-600" />
              </button>
            </div>

            <div className="flex gap-2 bg-gray-100 p-1 rounded-lg">
              <button
                onClick={() => setViewMode("month")}
                className={`px-4 py-2 rounded-md font-medium transition-all ${
                  viewMode === "month"
                    ? "bg-white text-gray-900 shadow-sm"
                    : "text-gray-600 hover:text-gray-900"
                }`}
              >
                Month View
              </button>
              <button
                onClick={() => setViewMode("list")}
                className={`px-4 py-2 rounded-md font-medium transition-all ${
                  viewMode === "list"
                    ? "bg-white text-gray-900 shadow-sm"
                    : "text-gray-600 hover:text-gray-900"
                }`}
              >
                List View
              </button>
            </div>
          </div>
        </div>

        {/* Main Content */}
        {viewMode === "month" ? (
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
            {/* Calendar */}
            <div className="lg:col-span-2">
              <div className="bg-white rounded-xl border border-gray-200 overflow-hidden shadow-sm">
                <div className="grid grid-cols-7 bg-gray-50 border-b border-gray-200">
                  {weekDays.map((day) => (
                    <div
                      key={day}
                      className="p-3 text-center text-sm font-semibold text-gray-600"
                    >
                      {day}
                    </div>
                  ))}
                </div>
                <div className="grid grid-cols-7">{renderCalendar()}</div>
              </div>
            </div>

            {/* Events List for Selected Date */}
            <div className="lg:col-span-1">{renderEventsList()}</div>
          </div>
        ) : (
          <div className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm">
            {renderListView()}
          </div>
        )}
      </div>
    </div>
  );
}
