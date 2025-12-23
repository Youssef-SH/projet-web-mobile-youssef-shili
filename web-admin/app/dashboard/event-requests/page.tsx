"use client";

import { useState, useEffect } from "react";
import {
  Calendar,
  Clock,
  Users,
  MapPin,
  FileText,
  CheckCircle,
  XCircle,
  Eye,
  Filter,
  ChevronLeft,
  ChevronRight,
  Loader2,
  Search,
  Building2,
  AlertCircle,
  X,
} from "lucide-react";

interface EventRequest {
  id: string;
  title: string;
  eventType: string;
  clubName: string;
  status: "Pending" | "Approved" | "Rejected";
  startTime: string;
  endTime: string;
  submittedAt: string;
  submittedBy: {
    role: string;
  };
  description?: string;
  expectedStudents?: number;
  location?: string;
}

interface RequestDetail extends EventRequest {
  clubId: string;
  submittedBy: {
    role: string;
    fullName: string;
    email: string;
    phone: string;
    cin: string;
    studyLevel: string;
    specialization: string;
  };
  roomId?: string;
  externalAddress?: string;
  adminComment?: string;
  annexes?: Array<{
    annexTemplateId: string;
    fileUrl: string;
    validated: boolean;
  }>;
}

export default function EventRequestsPage() {
  const [requests, setRequests] = useState<EventRequest[]>([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [total, setTotal] = useState(0);
  const [statusFilter, setStatusFilter] = useState<string>("");
  const [clubFilter, setClubFilter] = useState<string>("");
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedRequest, setSelectedRequest] = useState<RequestDetail | null>(
    null
  );
  const [showApproveModal, setShowApproveModal] = useState(false);
  const [showRejectModal, setShowRejectModal] = useState(false);
  const [adminComment, setAdminComment] = useState("");
  const [actionLoading, setActionLoading] = useState(false);

  const mockRequests: EventRequest[] = [
    {
      id: "1",
      title: "AI Workshop 2025",
      description:
        "Introduction to Artificial Intelligence and Machine Learning",
      eventType: "Scientific",
      clubName: "IEEE ISIMM",
      status: "Pending",
      startTime: "2025-11-18T09:00:00Z",
      endTime: "2025-11-18T17:00:00Z",
      submittedAt: "2025-11-08T10:00:00Z",
      submittedBy: { role: "President" },
      expectedStudents: 150,
      location: "Amphi A",
    },
    {
      id: "2",
      title: "Tech Meetup",
      description: "Networking event for tech enthusiasts",
      eventType: "Social",
      clubName: "ARSII",
      status: "Pending",
      startTime: "2025-12-01T14:00:00Z",
      endTime: "2025-12-01T18:00:00Z",
      submittedAt: "2025-11-15T12:00:00Z",
      submittedBy: { role: "VicePresident" },
      expectedStudents: 80,
      location: "C-11",
    },
    {
      id: "3",
      title: "Debate Championship",
      description: "Annual debate competition",
      eventType: "Entertainment",
      clubName: "Debate Club",
      status: "Approved",
      startTime: "2025-10-25T10:00:00Z",
      endTime: "2025-10-25T16:00:00Z",
      submittedAt: "2025-10-10T08:00:00Z",
      submittedBy: { role: "President" },
      expectedStudents: 200,
      location: "Amphi B",
    },
    {
      id: "4",
      title: "Coding Marathon",
      description: "24-hour hackathon",
      eventType: "Entertainment",
      clubName: "IEEE ISIMM",
      status: "Rejected",
      startTime: "2025-11-20T08:00:00Z",
      endTime: "2025-11-21T08:00:00Z",
      submittedAt: "2025-11-05T09:00:00Z",
      submittedBy: { role: "President" },
      expectedStudents: 100,
      location: "Lab 1",
    },
  ];

  useEffect(() => {
    fetchRequests();
  }, [page, statusFilter, clubFilter]);

  const fetchRequests = async () => {
    setLoading(true);

    setTimeout(() => {
      const filtered = mockRequests.filter((req) => {
        const matchesStatus = !statusFilter || req.status === statusFilter;
        const matchesClub = !clubFilter || req.clubName === clubFilter;
        const matchesSearch =
          !searchQuery ||
          req.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
          req.clubName.toLowerCase().includes(searchQuery.toLowerCase());
        return matchesStatus && matchesClub && matchesSearch;
      });

      setRequests(filtered);
      setTotal(filtered.length);
      setTotalPages(Math.ceil(filtered.length / 10));
      setLoading(false);
    }, 500);
  };

  const getStatusConfig = (status: string) => {
    switch (status) {
      case "Pending":
        return {
          bg: "bg-yellow-500/20",
          text: "text-yellow-400",
          border: "border-yellow-500/30",
          icon: Clock,
        };
      case "Approved":
        return {
          bg: "bg-green-500/20",
          text: "text-green-400",
          border: "border-green-500/30",
          icon: CheckCircle,
        };
      case "Rejected":
        return {
          bg: "bg-red-500/20",
          text: "text-red-400",
          border: "border-red-500/30",
          icon: XCircle,
        };
      default:
        return {
          bg: "bg-gray-500/20",
          text: "text-gray-200",
          border: "border-gray-500/30",
          icon: AlertCircle,
        };
    }
  };

  const getEventTypeConfig = (type: string) => {
    switch (type) {
      case "Scientific":
        return { bg: "bg-blue-600/20", text: "text-blue-400" };
      case "Social":
        return { bg: "bg-purple-600/20", text: "text-purple-400" };
      case "Entertainment":
        return { bg: "bg-yellow-600/20", text: "text-yellow-400" };
      case "National":
        return { bg: "bg-red-600/20", text: "text-red-400" };
      case "Sports":
        return { bg: "bg-green-600/20", text: "text-green-400" };
      case "Artistic":
        return { bg: "bg-pink-600/20", text: "text-pink-400" };
      default:
        return { bg: "bg-gray-600/20", text: "text-gray-400" };
    }
  };

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString("en-US", {
      month: "short",
      day: "numeric",
      year: "numeric",
    });
  };

  const formatTime = (dateString: string) => {
    return new Date(dateString).toLocaleTimeString("en-US", {
      hour: "2-digit",
      minute: "2-digit",
    });
  };

  const handleApprove = async () => {
    setActionLoading(true);
    setTimeout(() => {
      alert(`Approved request with comment: ${adminComment}`);
      setShowApproveModal(false);
      setAdminComment("");
      setActionLoading(false);
      fetchRequests();
    }, 1000);
  };

  const handleReject = async () => {
    setActionLoading(true);
    setTimeout(() => {
      alert(`Rejected request with comment: ${adminComment}`);
      setShowRejectModal(false);
      setAdminComment("");
      setActionLoading(false);
      fetchRequests();
    }, 1000);
  };

  return (
    <div className="min-h-screen p-6 bg-gray-50">
      <div className="max-w-7xl mx-auto space-y-6">
        {/* Header */}
        <div className="p-6">
          <h1 className="text-4xl font-bold text-gray-900 mb-2">
            Event Requests
          </h1>
          <p className="text-gray-600">
            Review and manage event requests from clubs
          </p>
        </div>

        {/* Filters & Search */}
        <div className="bg-white rounded-2xl p-6 border border-gray-200 shadow-sm">
          <div className="flex items-center gap-4 mb-6">
            <Filter className="w-5 h-5 text-gray-500" />
            <h2 className="text-lg font-semibold text-gray-800">
              Filters & Search
            </h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            {/* Search */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Search
              </label>
              <div className="relative">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
                <input
                  type="text"
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  onKeyUp={() => fetchRequests()}
                  placeholder="Search by title or club..."
                  className="w-full pl-10 pr-4 py-2 bg-gray-50 border border-gray-200 rounded-lg text-gray-800 placeholder:text-gray-400 focus:ring-2 focus:ring-blue-300 focus:border-transparent outline-none"
                />
              </div>
            </div>

            {/* Status Filter */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Status
              </label>
              <select
                value={statusFilter}
                onChange={(e) => {
                  setStatusFilter(e.target.value);
                  setPage(1);
                }}
                className="w-full px-4 py-2 bg-gray-50 border border-gray-200 rounded-lg text-gray-800 focus:ring-2 focus:ring-blue-300 focus:border-transparent outline-none"
              >
                <option value="" className="bg-white">
                  All Statuses
                </option>
                <option value="Pending" className="bg-white">
                  Pending
                </option>
                <option value="Approved" className="bg-white">
                  Approved
                </option>
                <option value="Rejected" className="bg-white">
                  Rejected
                </option>
              </select>
            </div>

            {/* Club Filter */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Club
              </label>
              <select
                value={clubFilter}
                onChange={(e) => {
                  setClubFilter(e.target.value);
                  setPage(1);
                }}
                className="w-full px-4 py-2 bg-gray-50 border border-gray-200 rounded-lg text-gray-800 focus:ring-2 focus:ring-blue-300 focus:border-transparent outline-none"
              >
                <option value="" className="bg-white">
                  All Clubs
                </option>
                <option value="IEEE ISIMM" className="bg-white">
                  IEEE ISIMM
                </option>
                <option value="ARSII" className="bg-white">
                  ARSII
                </option>
                <option value="Debate Club" className="bg-white">
                  Debate Club
                </option>
              </select>
            </div>
          </div>
        </div>

        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="bg-white rounded-2xl p-6 border border-gray-200 shadow-sm">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-gray-500 mb-1">
                  Pending
                </p>
                <h3 className="text-3xl font-bold text-yellow-400">
                  {mockRequests.filter((r) => r.status === "Pending").length}
                </h3>
              </div>
              <Clock className="w-10 h-10 text-yellow-400" />
            </div>
          </div>

          <div className="bg-white rounded-2xl p-6 border border-gray-200 shadow-sm">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-gray-500 mb-1">
                  Approved
                </p>
                <h3 className="text-3xl font-bold text-green-400">
                  {mockRequests.filter((r) => r.status === "Approved").length}
                </h3>
              </div>
              <CheckCircle className="w-10 h-10 text-green-400" />
            </div>
          </div>

          <div className="bg-white rounded-2xl p-6 border border-gray-200 shadow-sm">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-gray-500 mb-1">
                  Rejected
                </p>
                <h3 className="text-3xl font-bold text-red-400">
                  {mockRequests.filter((r) => r.status === "Rejected").length}
                </h3>
              </div>
              <XCircle className="w-10 h-10 text-red-400" />
            </div>
          </div>
        </div>

        {/* Requests List */}
        {loading ? (
          <div className="flex items-center justify-center py-20">
            <Loader2 className="w-8 h-8 text-blue-600 animate-spin" />
          </div>
        ) : requests.length === 0 ? (
          <div className="bg-white rounded-2xl p-12 border border-gray-200 shadow-sm text-center">
            <Calendar className="w-16 h-16 text-gray-400 mx-auto mb-4" />
            <h3 className="text-xl font-semibold text-gray-900 mb-2">
              No requests found
            </h3>
            <p className="text-gray-500">Try adjusting your filters</p>
          </div>
        ) : (
          <div className="space-y-4">
            {requests.map((request) => {
              const statusConfig = getStatusConfig(request.status);
              const typeConfig = getEventTypeConfig(request.eventType);

              return (
                <div
                  key={request.id}
                  className="bg-white rounded-2xl p-6 border border-gray-200 hover:shadow-lg transition-all"
                >
                  <div className="flex items-start justify-between gap-4">
                    <div className="flex-1">
                      <div className="flex items-center gap-3 mb-3">
                        <h3 className="text-2xl font-bold text-gray-900">
                          {request.title}
                        </h3>

                        <span
                          className={`px-3 py-1 rounded-full text-xs font-medium border flex items-center gap-1 ${
                            statusConfig.bg ?? "bg-gray-50"
                          } ${statusConfig.text ?? "text-gray-700"} ${
                            statusConfig.border ?? "border-gray-100"
                          }`}
                        >
                          {statusConfig.icon && (
                            <statusConfig.icon className="w-3 h-3" />
                          )}
                          {request.status}
                        </span>

                        <span
                          className={`px-3 py-1 rounded-full text-xs font-medium ${
                            typeConfig.bg ?? "bg-gray-50"
                          } ${typeConfig.text ?? "text-gray-700"}`}
                        >
                          {request.eventType}
                        </span>
                      </div>

                      <div className="flex items-center gap-2 mb-4">
                        <Building2 className="w-4 h-4 text-gray-400" />
                        <p className="text-gray-700 font-medium">
                          {request.clubName}
                        </p>
                      </div>

                      {request.description && (
                        <p className="text-gray-600 mb-4 line-clamp-2">
                          {request.description}
                        </p>
                      )}

                      <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
                        <div className="flex items-center gap-2 text-gray-600">
                          <Calendar className="w-4 h-4 text-blue-500" />
                          <span>{formatDate(request.startTime)}</span>
                        </div>

                        <div className="flex items-center gap-2 text-gray-600">
                          <Clock className="w-4 h-4 text-purple-500" />
                          <span>
                            {formatTime(request.startTime)} -{" "}
                            {formatTime(request.endTime)}
                          </span>
                        </div>

                        <div className="flex items-center gap-2 text-gray-600">
                          <Users className="w-4 h-4 text-green-500" />
                          <span>
                            {request.expectedStudents || "N/A"} students
                          </span>
                        </div>

                        <div className="flex items-center gap-2 text-gray-600">
                          <MapPin className="w-4 h-4 text-orange-500" />
                          <span>{request.location}</span>
                        </div>
                      </div>

                      <div className="mt-4 pt-4 border-t border-gray-100">
                        <div className="flex items-center gap-4 text-sm text-gray-500">
                          <span>By {request.submittedBy.role}</span>
                          <span>•</span>
                          <span>
                            Submitted {formatDate(request.submittedAt)}
                          </span>
                        </div>
                      </div>
                    </div>

                    <div className="flex flex-col gap-2">
                      <button
                        onClick={() => alert(`View details: ${request.id}`)}
                        className="p-3 bg-blue-500 hover:bg-blue-100 text-blue-700 rounded-xl transition-colors"
                        title="View Details"
                      >
                        <Eye className="w-5 h-5 text-white" />
                      </button>

                      {request.status === "Pending" && (
                        <>
                          <button
                            onClick={() => {
                              setSelectedRequest(request as RequestDetail);
                              setShowApproveModal(true);
                            }}
                            className="p-3 bg-green-500 hover:bg-green-700 text-white rounded-xl transition-colors"
                            title="Approve"
                          >
                            <CheckCircle className="w-5 h-5" />
                          </button>

                          <button
                            onClick={() => {
                              setSelectedRequest(request as RequestDetail);
                              setShowRejectModal(true);
                            }}
                            className="p-3 bg-red-500 hover:bg-red-700 text-white rounded-xl transition-colors"
                            title="Reject"
                          >
                            <XCircle className="w-5 h-5" />
                          </button>
                        </>
                      )}
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        )}

        {/* Pagination */}
        {!loading && requests.length > 0 && (
          <div className="flex items-center justify-between bg-white rounded-2xl p-4 border border-gray-200 shadow-sm">
            <p className="text-sm text-gray-600">
              Showing{" "}
              <span className="font-medium text-gray-900">
                {(page - 1) * 10 + 1}
              </span>{" "}
              to{" "}
              <span className="font-medium text-gray-900">
                {Math.min(page * 10, total)}
              </span>{" "}
              of <span className="font-medium text-gray-900">{total}</span>{" "}
              requests
            </p>

            <div className="flex gap-2">
              <button
                onClick={() => setPage((p) => Math.max(1, p - 1))}
                disabled={page === 1}
                className="p-2 bg-gray-50 hover:bg-gray-100 disabled:opacity-50 disabled:cursor-not-allowed text-gray-700 rounded-lg transition-colors"
              >
                <ChevronLeft className="w-5 h-5" />
              </button>

              <span className="px-4 py-2 bg-gray-50 text-gray-900 rounded-lg font-medium">
                {page} / {totalPages}
              </span>

              <button
                onClick={() => setPage((p) => Math.min(totalPages, p + 1))}
                disabled={page === totalPages}
                className="p-2 bg-gray-50 hover:bg-gray-100 disabled:opacity-50 disabled:cursor-not-allowed text-gray-700 rounded-lg transition-colors"
              >
                <ChevronRight className="w-5 h-5" />
              </button>
            </div>
          </div>
        )}
      </div>

      {/* Approve Modal */}
      {showApproveModal && (
        <div className="fixed inset-0 bg-black/40 flex items-center justify-center p-4 z-50">
          <div className="bg-white rounded-2xl p-6 max-w-md w-full border border-gray-200 shadow-lg">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-xl font-bold text-gray-900">
                Approve Event Request
              </h3>
              <button
                onClick={() => setShowApproveModal(false)}
                className="p-1 hover:bg-gray-100 rounded-lg transition-colors"
              >
                <X className="w-5 h-5 text-gray-500" />
              </button>
            </div>

            <p className="text-gray-700 mb-4">
              Are you sure you want to approve this event request? You can add
              an optional comment.
            </p>

            <textarea
              value={adminComment}
              onChange={(e) => setAdminComment(e.target.value)}
              placeholder="Add approval comment (optional)..."
              rows={3}
              className="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-lg text-gray-800 placeholder:text-gray-400 focus:ring-2 focus:ring-green-300 focus:border-transparent outline-none mb-4"
            />

            <div className="flex gap-3">
              <button
                onClick={() => setShowApproveModal(false)}
                className="flex-1 px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg transition-colors"
              >
                Cancel
              </button>
              <button
                onClick={handleApprove}
                disabled={actionLoading}
                className="flex-1 px-4 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg transition-colors disabled:opacity-50 flex items-center justify-center gap-2"
              >
                {actionLoading ? (
                  <>
                    <Loader2 className="w-4 h-4 animate-spin" />
                    Approving...
                  </>
                ) : (
                  <>
                    <CheckCircle className="w-4 h-4" />
                    Approve
                  </>
                )}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Reject Modal */}
      {showRejectModal && (
        <div className="fixed inset-0 bg-black/40 flex items-center justify-center p-4 z-50">
          <div className="bg-white rounded-2xl p-6 max-w-md w-full border border-gray-200 shadow-lg">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-xl font-bold text-gray-900">
                Reject Event Request
              </h3>
              <button
                onClick={() => setShowRejectModal(false)}
                className="p-1 hover:bg-gray-100 rounded-lg transition-colors"
              >
                <X className="w-5 h-5 text-gray-500" />
              </button>
            </div>

            <p className="text-gray-700 mb-4">
              Please provide a reason for rejecting this event request. This
              will be visible to the club.
            </p>

            <textarea
              value={adminComment}
              onChange={(e) => setAdminComment(e.target.value)}
              placeholder="Reason for rejection (required)..."
              rows={3}
              className="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-lg text-gray-800 placeholder:text-gray-400 focus:ring-2 focus:ring-red-300 focus:border-transparent outline-none mb-4"
              required
            />

            <div className="flex gap-3">
              <button
                onClick={() => setShowRejectModal(false)}
                className="flex-1 px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg transition-colors"
              >
                Cancel
              </button>
              <button
                onClick={handleReject}
                disabled={actionLoading || !adminComment.trim()}
                className="flex-1 px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg transition-colors disabled:opacity-50 flex items-center justify-center gap-2"
              >
                {actionLoading ? (
                  <>
                    <Loader2 className="w-4 h-4 animate-spin" />
                    Rejecting...
                  </>
                ) : (
                  <>
                    <XCircle className="w-4 h-4" />
                    Reject
                  </>
                )}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
