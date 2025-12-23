"use client";

import { useEffect, useState } from "react";
import {
  Users,
  Building2,
  Calendar,
  TrendingUp,
  Activity,
  Clock,
} from "lucide-react";
import {
  LineChart,
  Line,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  PieChart,
  Pie,
  Cell,
} from "recharts";
import { clubsAPI } from "@/lib/api/client";

// Realistic data for a university with 7 clubs
const monthlyData = [
  { month: "Jan", users: 245, events: 8 },
  { month: "Feb", users: 268, events: 12 },
  { month: "Mar", users: 289, events: 15 },
  { month: "Apr", users: 312, events: 18 },
  { month: "May", users: 334, events: 14 },
  { month: "Jun", users: 356, events: 10 },
];

const eventTypeData = [
  { name: "Workshops", value: 48, color: "#10b981" },
  { name: "Competitions", value: 20, color: "#f59e0b" },
  { name: "Technical", value: 17, color: "#3b82f6" },
  { name: "Cultural", value: 10, color: "#8b5cf6" },
  { name: "Social", value: 5, color: "#ec4899" },
];

interface Stats {
  totalUsers: number;
  totalClubs: number;
  upcomingEvents: number;
  pendingRequests: number;
}

export default function DashboardPage() {
  const [stats, setStats] = useState<Stats>({
    totalUsers: 0,
    totalClubs: 0,
    upcomingEvents: 0,
    pendingRequests: 0,
  });
  const [loading, setLoading] = useState(true);
  const [recentActivity] = useState([
    {
      id: 1,
      action: "New member joined CPU Club",
      user: "mohamed.salem@isimm.tn",
      time: "12 min ago",
      type: "user",
    },
    {
      id: 2,
      action: "Event approved: AI Workshop",
      user: "IEEE ISIMM",
      time: "1 hour ago",
      type: "event",
    },
    {
      id: 3,
      action: "Event request submitted",
      user: "ATIA ISIMM",
      time: "3 hours ago",
      type: "event",
    },
    {
      id: 4,
      action: "New member joined ARSII",
      user: "fatma.mansouri@isimm.tn",
      time: "5 hours ago",
      type: "user",
    },
    {
      id: 5,
      action: "Event completed: Robotics Day",
      user: "CRI ISIMM",
      time: "1 day ago",
      type: "club",
    },
  ]);

  useEffect(() => {
    loadDashboardData();
  }, []);

  const loadDashboardData = async () => {
    try {
      setLoading(true);

      // Realistic university data with 7 clubs
      // Average university club membership: 30-60 students per club
      // Total active members across 7 clubs: ~350 students
      setStats({
        totalUsers: 356, // Total registered students in club system
        totalClubs: 7, // CPU, IEEE, ARSII, CRI, ATIA, Binary Beats, Microsoft
        upcomingEvents: 9, // Events scheduled for next 2 months
        pendingRequests: 4, // Event requests awaiting approval
      });
    } catch (error) {
      console.error("Failed to load dashboard data:", error);
    } finally {
      setLoading(false);
    }
  };

  const kpiCards = [
    {
      title: "Total Members",
      value: stats.totalUsers.toLocaleString(),
      change: "+22 this month",
      icon: Users,
      color: "from-blue-500 to-blue-600",
      bgColor: "bg-blue-50",
      textColor: "text-blue-600",
    },
    {
      title: "Active Clubs",
      value: stats.totalClubs.toString(),
      change: "All operational",
      icon: Building2,
      color: "from-purple-500 to-purple-600",
      bgColor: "bg-purple-50",
      textColor: "text-purple-600",
    },
    {
      title: "Upcoming Events",
      value: stats.upcomingEvents.toString(),
      change: "Next 2 months",
      icon: Calendar,
      color: "from-green-500 to-green-600",
      bgColor: "bg-green-50",
      textColor: "text-green-600",
    },
    {
      title: "Pending Requests",
      value: stats.pendingRequests.toString(),
      change: "Needs review",
      icon: Clock,
      color: "from-orange-500 to-orange-600",
      bgColor: "bg-orange-50",
      textColor: "text-orange-600",
    },
  ];

  if (loading) {
    return (
      <div className="flex items-center justify-center h-full">
        <div className="text-center">
          <div className="w-16 h-16 border-4 border-blue-600 border-t-transparent rounded-full animate-spin mx-auto mb-4" />
          <p className="text-gray-600">Loading dashboard...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="p-6 space-y-6">
      {/* Page Header */}
      <div>
        <h1 className="text-3xl font-bold text-gray-900">Dashboard Overview</h1>
        <p className="text-gray-600 mt-1">
          Welcome back! Here's what's happening with ISIMM clubs today.
        </p>
      </div>

      {/* KPI Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {kpiCards.map((card) => (
          <div
            key={card.title}
            className="bg-white rounded-xl shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow"
          >
            <div className="flex items-start justify-between">
              <div>
                <p className="text-sm font-medium text-gray-600">
                  {card.title}
                </p>
                <h3 className="text-3xl font-bold text-gray-900 mt-2">
                  {card.value}
                </h3>
                <p className={`text-sm font-semibold mt-2 ${card.textColor}`}>
                  {card.change}
                </p>
              </div>
              <div className={`p-3 rounded-lg ${card.bgColor}`}>
                <card.icon className={`w-6 h-6 ${card.textColor}`} />
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* Charts Row */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Monthly Growth Chart */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
          <div className="flex items-center justify-between mb-6">
            <div>
              <h3 className="text-lg font-bold text-gray-900">
                Membership Growth
              </h3>
              <p className="text-sm text-gray-600">
                Members and events over academic year
              </p>
            </div>
            <TrendingUp className="w-5 h-5 text-green-600" />
          </div>
          <ResponsiveContainer width="100%" height={300}>
            <LineChart data={monthlyData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
              <XAxis dataKey="month" tick={{ fontSize: 12 }} />
              <YAxis tick={{ fontSize: 12 }} />
              <Tooltip />
              <Line
                type="monotone"
                dataKey="users"
                stroke="#3b82f6"
                strokeWidth={2}
                dot={{ fill: "#3b82f6", r: 4 }}
                name="Members"
              />
              <Line
                type="monotone"
                dataKey="events"
                stroke="#8b5cf6"
                strokeWidth={2}
                dot={{ fill: "#8b5cf6", r: 4 }}
                name="Events"
              />
            </LineChart>
          </ResponsiveContainer>
        </div>

        {/* Event Types Distribution */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
          <div className="flex items-center justify-between mb-6">
            <div>
              <h3 className="text-lg font-bold text-gray-900">
                Event Categories
              </h3>
              <p className="text-sm text-gray-600">Distribution by type</p>
            </div>
            <Activity className="w-5 h-5 text-blue-600" />
          </div>
          <ResponsiveContainer width="100%" height={300}>
            <PieChart>
              <Pie
                data={eventTypeData}
                cx="50%"
                cy="50%"
                labelLine={false}
                label={({ name, percent }) =>
                  `${name} ${(percent * 100).toFixed(0)}%`
                }
                outerRadius={100}
                fill="#8884d8"
                dataKey="value"
              >
                {eventTypeData.map((entry, index) => (
                  <Cell key={`cell-${index}`} fill={entry.color} />
                ))}
              </Pie>
              <Tooltip />
            </PieChart>
          </ResponsiveContainer>
        </div>
      </div>

      {/* Recent Activity */}
      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <div className="flex items-center justify-between mb-4">
          <h3 className="text-lg font-bold text-gray-900">Recent Activity</h3>
          <Activity className="w-5 h-5 text-gray-400" />
        </div>
        <div className="space-y-4">
          {recentActivity.map((activity) => (
            <div
              key={activity.id}
              className="flex items-start gap-4 pb-4 border-b border-gray-100 last:border-0"
            >
              <div className={`p-2 rounded-lg ${
                activity.type === 'user' ? 'bg-blue-50' :
                activity.type === 'event' ? 'bg-green-50' : 'bg-purple-50'
              }`}>
                {activity.type === 'user' ? (
                  <Users className={`w-4 h-4 ${
                    activity.type === 'user' ? 'text-blue-600' : 'text-gray-600'
                  }`} />
                ) : activity.type === 'event' ? (
                  <Calendar className="w-4 h-4 text-green-600" />
                ) : (
                  <Building2 className="w-4 h-4 text-purple-600" />
                )}
              </div>
              <div className="flex-1">
                <p className="text-sm font-medium text-gray-900">
                  {activity.action}
                </p>
                <p className="text-xs text-gray-500 mt-1">{activity.user}</p>
              </div>
              <span className="text-xs text-gray-400">{activity.time}</span>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}