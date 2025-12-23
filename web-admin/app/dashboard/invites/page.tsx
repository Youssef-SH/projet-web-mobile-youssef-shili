// ============================================
// FILE: app/admin/invites/page.tsx
// Route: /admin/invites (Bulk Invite Management)
// ============================================
"use client";

import { useState } from "react";
import {
  Upload,
  UserPlus,
  Building2,
  AlertCircle,
  CheckCircle,
  XCircle,
  Download,
  Mail,
  Eye,
  FileText,
  Loader2,
  X,
  Users,
  AlertTriangle,
} from "lucide-react";

interface PreviewSummary {
  accountType: "student" | "club";
  mode: "add" | "replace";
  totalRows: number;
  willCreate: number;
  willSkip: number;
  willDeactivate: number;
}

interface InvalidRow {
  row: number;
  email: string;
  reason: string;
}

interface BulkResult {
  accountType: "student" | "club";
  mode: "add" | "replace";
  created: number;
  skipped: number;
  deactivated: number;
}

export default function InvitesPage() {
  const [accountType, setAccountType] = useState<"student" | "club">("student");
  const [mode, setMode] = useState<"add" | "replace">("add");
  const [file, setFile] = useState<File | null>(null);
  const [previewLoading, setPreviewLoading] = useState(false);
  const [bulkLoading, setBulkLoading] = useState(false);
  const [previewData, setPreviewData] = useState<PreviewSummary | null>(null);
  const [invalidRows, setInvalidRows] = useState<InvalidRow[]>([]);
  const [bulkResult, setBulkResult] = useState<BulkResult | null>(null);
  const [error, setError] = useState("");
  const [showConfirmModal, setShowConfirmModal] = useState(false);
  const [showResendModal, setShowResendModal] = useState(false);
  const [resendEmails, setResendEmails] = useState("");
  const [resendLoading, setResendLoading] = useState(false);

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const selectedFile = e.target.files?.[0];
    if (selectedFile) {
      if (selectedFile.type !== "text/csv") {
        setError("Please upload a valid CSV file");
        return;
      }
      setFile(selectedFile);
      setError("");
      setPreviewData(null);
      setInvalidRows([]);
      setBulkResult(null);
    }
  };

  const handlePreview = async () => {
    if (!file) {
      setError("Please select a file first");
      return;
    }

    setPreviewLoading(true);
    setError("");

    // TODO: Replace with real API call
    // const formData = new FormData();
    // formData.append('file', file);
    // const result = await authAPI.invites.preview(accountType, mode, formData);

    setTimeout(() => {
      // Mock preview data
      const mockPreview: PreviewSummary = {
        accountType,
        mode,
        totalRows: 120,
        willCreate: 15,
        willSkip: 100,
        willDeactivate: mode === "replace" ? 5 : 0,
      };

      const mockInvalidRows: InvalidRow[] = [
        {
          row: 7,
          email: "bad@",
          reason: "Invalid email format",
        },
        {
          row: 15,
          email: "duplicate@isimm.tn",
          reason: "Duplicate email in CSV",
        },
      ];

      setPreviewData(mockPreview);
      setInvalidRows(mockInvalidRows);
      setPreviewLoading(false);
    }, 1500);
  };

  const handleBulkImport = async () => {
    if (!file) return;

    setBulkLoading(true);
    setError("");

    // TODO: Replace with real API call
    // const formData = new FormData();
    // formData.append('file', file);
    // formData.append('confirm', 'CONFIRM');
    // const result = await authAPI.invites.bulk(accountType, mode, formData);

    setTimeout(() => {
      const mockResult: BulkResult = {
        accountType,
        mode,
        created: 15,
        skipped: 100,
        deactivated: mode === "replace" ? 5 : 0,
      };

      setBulkResult(mockResult);
      setShowConfirmModal(false);
      setBulkLoading(false);
      setFile(null);
      setPreviewData(null);
    }, 2000);
  };

  const handleResendInvites = async () => {
    const emails = resendEmails
      .split("\n")
      .map((e) => e.trim())
      .filter((e) => e);

    if (emails.length === 0) {
      setError("Please enter at least one email");
      return;
    }

    setResendLoading(true);
    setError("");

    // TODO: Replace with real API call
    // const result = await authAPI.invites.resend({ emails });

    setTimeout(() => {
      alert(`✅ Sent ${emails.length} invite(s)`);
      setShowResendModal(false);
      setResendEmails("");
      setResendLoading(false);
    }, 1500);
  };

  const downloadTemplate = () => {
    const csv = "email\nstudent1@isimm.tn\nstudent2@isimm.tn\n";
    const blob = new Blob([csv], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "invite_template.csv";
    a.click();
    URL.revokeObjectURL(url);
  };

  return (
    <div className="min-h-screen p-6 bg-gray-50">
      <div className="max-w-6xl mx-auto space-y-6">
        {/* Header */}
        <div>
          <h1 className="text-4xl font-bold text-gray-900 mb-2">
            Bulk Invites
          </h1>
          <p className="text-gray-600">
            Import students or clubs via CSV and manage pending invitations
          </p>
        </div>

        {/* Quick Actions */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <button
            onClick={downloadTemplate}
            className="bg-white rounded-2xl p-6 border border-gray-200 shadow-sm hover:shadow-lg transition-all text-left"
          >
            <div className="flex items-center gap-4">
              <div className="p-3 bg-blue-50 rounded-xl">
                <Download className="w-6 h-6 text-blue-600" />
              </div>
              <div>
                <h3 className="text-lg font-bold text-gray-900 mb-1">
                  Download Template
                </h3>
                <p className="text-sm text-gray-600">
                  Get the CSV template with correct format
                </p>
              </div>
            </div>
          </button>

          <button
            onClick={() => setShowResendModal(true)}
            className="bg-white rounded-2xl p-6 border border-gray-200 shadow-sm hover:shadow-lg transition-all text-left"
          >
            <div className="flex items-center gap-4">
              <div className="p-3 bg-purple-50 rounded-xl">
                <Mail className="w-6 h-6 text-purple-600" />
              </div>
              <div>
                <h3 className="text-lg font-bold text-gray-900 mb-1">
                  Resend Invites
                </h3>
                <p className="text-sm text-gray-600">
                  Resend invitation emails to pending users
                </p>
              </div>
            </div>
          </button>
        </div>

        {/* Import Form */}
        <div className="bg-white rounded-2xl p-6 border border-gray-200 shadow-sm">
          <div className="flex items-center gap-2 mb-6">
            <Upload className="w-5 h-5 text-blue-600" />
            <h2 className="text-xl font-bold text-gray-900">
              Import from CSV
            </h2>
          </div>

          <div className="space-y-6">
            {/* Configuration */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {/* Account Type */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Account Type
                </label>
                <div className="grid grid-cols-2 gap-3">
                  <button
                    onClick={() => setAccountType("student")}
                    className={`p-4 rounded-xl border-2 transition-all ${
                      accountType === "student"
                        ? "border-blue-500 bg-blue-50 text-blue-700"
                        : "border-gray-200 bg-white text-gray-700 hover:border-gray-300"
                    }`}
                  >
                    <UserPlus className="w-6 h-6 mx-auto mb-2" />
                    <p className="text-sm font-semibold">Students</p>
                  </button>
                  <button
                    onClick={() => setAccountType("club")}
                    className={`p-4 rounded-xl border-2 transition-all ${
                      accountType === "club"
                        ? "border-purple-500 bg-purple-50 text-purple-700"
                        : "border-gray-200 bg-white text-gray-700 hover:border-gray-300"
                    }`}
                  >
                    <Building2 className="w-6 h-6 mx-auto mb-2" />
                    <p className="text-sm font-semibold">Clubs</p>
                  </button>
                </div>
              </div>

              {/* Mode */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Import Mode
                </label>
                <div className="grid grid-cols-2 gap-3">
                  <button
                    onClick={() => setMode("add")}
                    className={`p-4 rounded-xl border-2 transition-all ${
                      mode === "add"
                        ? "border-green-500 bg-green-50 text-green-700"
                        : "border-gray-200 bg-white text-gray-700 hover:border-gray-300"
                    }`}
                  >
                    <CheckCircle className="w-6 h-6 mx-auto mb-2" />
                    <p className="text-sm font-semibold">Add</p>
                    <p className="text-xs text-gray-500 mt-1">
                      Keep existing
                    </p>
                  </button>
                  <button
                    onClick={() => setMode("replace")}
                    className={`p-4 rounded-xl border-2 transition-all ${
                      mode === "replace"
                        ? "border-orange-500 bg-orange-50 text-orange-700"
                        : "border-gray-200 bg-white text-gray-700 hover:border-gray-300"
                    }`}
                  >
                    <AlertTriangle className="w-6 h-6 mx-auto mb-2" />
                    <p className="text-sm font-semibold">Replace</p>
                    <p className="text-xs text-gray-500 mt-1">
                      Remove unlisted
                    </p>
                  </button>
                </div>
              </div>
            </div>

            {/* Mode Description */}
            <div
              className={`p-4 rounded-xl border ${
                mode === "replace"
                  ? "bg-orange-50 border-orange-200"
                  : "bg-blue-50 border-blue-200"
              }`}
            >
              <div className="flex items-start gap-3">
                <AlertCircle
                  className={`w-5 h-5 flex-shrink-0 mt-0.5 ${
                    mode === "replace" ? "text-orange-600" : "text-blue-600"
                  }`}
                />
                <div>
                  <p
                    className={`text-sm font-semibold mb-1 ${
                      mode === "replace" ? "text-orange-900" : "text-blue-900"
                    }`}
                  >
                    {mode === "add" ? "Add Mode" : "Replace Mode (Destructive)"}
                  </p>
                  <p
                    className={`text-sm ${
                      mode === "replace" ? "text-orange-700" : "text-blue-700"
                    }`}
                  >
                    {mode === "add"
                      ? "Creates new invites for emails not already in the database. Existing users are not affected."
                      : "CSV becomes the source of truth. Users of this type NOT in the CSV will be deactivated and lose access immediately."}
                  </p>
                </div>
              </div>
            </div>

            {/* File Upload */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                CSV File
              </label>
              <div className="relative">
                <input
                  type="file"
                  accept=".csv"
                  onChange={handleFileChange}
                  className="hidden"
                  id="csv-upload"
                />
                <label
                  htmlFor="csv-upload"
                  className="flex items-center justify-center w-full p-8 border-2 border-dashed border-gray-300 rounded-xl hover:border-blue-400 hover:bg-blue-50 transition-all cursor-pointer"
                >
                  {file ? (
                    <div className="text-center">
                      <FileText className="w-12 h-12 text-blue-600 mx-auto mb-2" />
                      <p className="text-sm font-semibold text-gray-900">
                        {file.name}
                      </p>
                      <p className="text-xs text-gray-500 mt-1">
                        {(file.size / 1024).toFixed(2)} KB
                      </p>
                    </div>
                  ) : (
                    <div className="text-center">
                      <Upload className="w-12 h-12 text-gray-400 mx-auto mb-2" />
                      <p className="text-sm font-semibold text-gray-700">
                        Click to upload CSV
                      </p>
                      <p className="text-xs text-gray-500 mt-1">
                        Must contain "email" column
                      </p>
                    </div>
                  )}
                </label>
              </div>
            </div>

            {/* Error Alert */}
            {error && (
              <div className="bg-red-50 border border-red-200 rounded-xl p-4 flex items-start gap-3">
                <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                <p className="text-sm text-red-700">{error}</p>
              </div>
            )}

            {/* Actions */}
            <div className="flex gap-3">
              <button
                onClick={handlePreview}
                disabled={!file || previewLoading}
                className="flex-1 px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white rounded-xl transition-colors disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2 font-semibold"
              >
                {previewLoading ? (
                  <>
                    <Loader2 className="w-5 h-5 animate-spin" />
                    Analyzing...
                  </>
                ) : (
                  <>
                    <Eye className="w-5 h-5" />
                    Preview Changes
                  </>
                )}
              </button>

              {file && (
                <button
                  onClick={() => {
                    setFile(null);
                    setPreviewData(null);
                    setInvalidRows([]);
                    setError("");
                  }}
                  className="px-6 py-3 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-xl transition-colors"
                >
                  Clear
                </button>
              )}
            </div>
          </div>
        </div>

        {/* Preview Results */}
        {previewData && (
          <div className="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden">
            <div className="p-6 border-b border-gray-200 bg-gradient-to-r from-blue-50 to-purple-50">
              <h2 className="text-xl font-bold text-gray-900 flex items-center gap-2">
                <Eye className="w-5 h-5 text-blue-600" />
                Preview Summary
              </h2>
              <p className="text-sm text-gray-600 mt-1">
                Review changes before applying
              </p>
            </div>

            <div className="p-6">
              {/* Stats Grid */}
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-6">
                <div className="text-center p-4 bg-gray-50 rounded-xl">
                  <FileText className="w-8 h-8 text-gray-600 mx-auto mb-2" />
                  <p className="text-2xl font-bold text-gray-900">
                    {previewData.totalRows}
                  </p>
                  <p className="text-sm text-gray-600">Total Rows</p>
                </div>

                <div className="text-center p-4 bg-green-50 rounded-xl">
                  <CheckCircle className="w-8 h-8 text-green-600 mx-auto mb-2" />
                  <p className="text-2xl font-bold text-green-700">
                    {previewData.willCreate}
                  </p>
                  <p className="text-sm text-gray-600">Will Create</p>
                </div>

                <div className="text-center p-4 bg-blue-50 rounded-xl">
                  <Users className="w-8 h-8 text-blue-600 mx-auto mb-2" />
                  <p className="text-2xl font-bold text-blue-700">
                    {previewData.willSkip}
                  </p>
                  <p className="text-sm text-gray-600">Will Skip</p>
                </div>

                {previewData.willDeactivate > 0 && (
                  <div className="text-center p-4 bg-red-50 rounded-xl">
                    <XCircle className="w-8 h-8 text-red-600 mx-auto mb-2" />
                    <p className="text-2xl font-bold text-red-700">
                      {previewData.willDeactivate}
                    </p>
                    <p className="text-sm text-gray-600">Will Deactivate</p>
                  </div>
                )}
              </div>

              {/* Invalid Rows */}
              {invalidRows.length > 0 && (
                <div className="mb-6">
                  <h3 className="text-lg font-bold text-gray-900 mb-3 flex items-center gap-2">
                    <AlertCircle className="w-5 h-5 text-red-600" />
                    Invalid Rows ({invalidRows.length})
                  </h3>
                  <div className="space-y-2 max-h-48 overflow-y-auto">
                    {invalidRows.map((invalid, idx) => (
                      <div
                        key={idx}
                        className="p-3 bg-red-50 border border-red-200 rounded-lg"
                      >
                        <p className="text-sm font-medium text-red-900">
                          Row {invalid.row}: {invalid.email}
                        </p>
                        <p className="text-xs text-red-700 mt-1">
                          {invalid.reason}
                        </p>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* Warning for Replace Mode */}
              {mode === "replace" && previewData.willDeactivate > 0 && (
                <div className="mb-6 p-4 bg-orange-50 border border-orange-200 rounded-xl">
                  <div className="flex items-start gap-3">
                    <AlertTriangle className="w-5 h-5 text-orange-600 flex-shrink-0 mt-0.5" />
                    <div>
                      <p className="text-sm font-semibold text-orange-900 mb-1">
                        Destructive Action Warning
                      </p>
                      <p className="text-sm text-orange-700">
                        {previewData.willDeactivate} existing{" "}
                        {previewData.accountType}
                        {previewData.willDeactivate > 1 ? "s" : ""} will be
                        deactivated and lose access immediately. This action
                        cannot be undone easily.
                      </p>
                    </div>
                  </div>
                </div>
              )}

              {/* Apply Button */}
              <button
                onClick={() => setShowConfirmModal(true)}
                disabled={invalidRows.length > 0}
                className="w-full px-6 py-3 bg-green-600 hover:bg-green-700 text-white rounded-xl transition-colors disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2 font-semibold"
              >
                <CheckCircle className="w-5 h-5" />
                Apply Changes
              </button>
            </div>
          </div>
        )}

        {/* Success Result */}
        {bulkResult && (
          <div className="bg-white rounded-2xl border border-green-200 shadow-sm overflow-hidden">
            <div className="p-6 border-b border-green-200 bg-gradient-to-r from-green-50 to-emerald-50">
              <h2 className="text-xl font-bold text-gray-900 flex items-center gap-2">
                <CheckCircle className="w-5 h-5 text-green-600" />
                Import Successful
              </h2>
            </div>

            <div className="p-6">
              <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
                <div className="text-center p-4 bg-green-50 rounded-xl">
                  <CheckCircle className="w-8 h-8 text-green-600 mx-auto mb-2" />
                  <p className="text-2xl font-bold text-green-700">
                    {bulkResult.created}
                  </p>
                  <p className="text-sm text-gray-600">Created</p>
                </div>

                <div className="text-center p-4 bg-blue-50 rounded-xl">
                  <Users className="w-8 h-8 text-blue-600 mx-auto mb-2" />
                  <p className="text-2xl font-bold text-blue-700">
                    {bulkResult.skipped}
                  </p>
                  <p className="text-sm text-gray-600">Skipped</p>
                </div>

                {bulkResult.deactivated > 0 && (
                  <div className="text-center p-4 bg-red-50 rounded-xl">
                    <XCircle className="w-8 h-8 text-red-600 mx-auto mb-2" />
                    <p className="text-2xl font-bold text-red-700">
                      {bulkResult.deactivated}
                    </p>
                    <p className="text-sm text-gray-600">Deactivated</p>
                  </div>
                )}
              </div>
            </div>
          </div>
        )}
      </div>

      {/* Confirm Modal */}
      {showConfirmModal && (
        <div className="fixed inset-0 bg-black/40 flex items-center justify-center p-4 z-50">
          <div className="bg-white rounded-2xl p-6 max-w-md w-full border border-gray-200 shadow-lg">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-xl font-bold text-gray-900">
                Confirm Import
              </h3>
              <button
                onClick={() => setShowConfirmModal(false)}
                className="p-1 hover:bg-gray-100 rounded-lg transition-colors"
              >
                <X className="w-5 h-5 text-gray-500" />
              </button>
            </div>

            <p className="text-gray-700 mb-6">
              {mode === "replace" ? (
                <>
                  ⚠️ This will <strong>deactivate</strong>{" "}
                  {previewData?.willDeactivate} existing{" "}
                  {accountType}
                  {previewData && previewData.willDeactivate > 1 ? "s" : ""}{" "}
                  and create {previewData?.willCreate} new invites. This action
                  is <strong>irreversible</strong>.
                </>
              ) : (
                <>
                  This will create {previewData?.willCreate} new invites and
                  skip {previewData?.willSkip} existing entries.
                </>
              )}
            </p>

            <div className="flex gap-3">
              <button
                onClick={() => setShowConfirmModal(false)}
                className="flex-1 px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg transition-colors"
              >
                Cancel
              </button>
              <button
                onClick={handleBulkImport}
                disabled={bulkLoading}
                className="flex-1 px-4 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg transition-colors disabled:opacity-50 flex items-center justify-center gap-2"
              >
                {bulkLoading ? (
                  <>
                    <Loader2 className="w-4 h-4 animate-spin" />
                    Importing...
                  </>
                ) : (
                  <>
                    <CheckCircle className="w-4 h-4" />
                    Confirm
                  </>
                )}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Resend Modal */}
      {showResendModal && (
        <div className="fixed inset-0 bg-black/40 flex items-center justify-center p-4 z-50">
          <div className="bg-white rounded-2xl p-6 max-w-md w-full border border-gray-200 shadow-lg">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-xl font-bold text-gray-900">
                Resend Invites
              </h3>
              <button
                onClick={() => {
                  setShowResendModal(false);
                  setResendEmails("");
                  setError("");
                }}
                className="p-1 hover:bg-gray-100 rounded-lg transition-colors"
              >
                <X className="w-5 h-5 text-gray-500" />
              </button>
            </div>

            <p className="text-gray-700 mb-4">
              Enter email addresses (one per line) to resend invitation emails.
            </p>

            <textarea
              value={resendEmails}
              onChange={(e) => setResendEmails(e.target.value)}
              placeholder="student1@isimm.tn&#10;student2@isimm.tn&#10;club@isimm.tn"
              rows={6}
              className="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-lg text-gray-800 placeholder:text-gray-400 focus:ring-2 focus:ring-purple-300 focus:border-transparent outline-none mb-4 font-mono text-sm"
            />

            <div className="flex gap-3">
              <button
                onClick={() => {
                  setShowResendModal(false);
                  setResendEmails("");
                }}
                className="flex-1 px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg transition-colors"
              >
                Cancel
              </button>
              <button
                onClick={handleResendInvites}
                disabled={resendLoading || !resendEmails.trim()}
                className="flex-1 px-4 py-2 bg-purple-600 hover:bg-purple-700 text-white rounded-lg transition-colors disabled:opacity-50 flex items-center justify-center gap-2"
              >
                {resendLoading ? (
                  <>
                    <Loader2 className="w-4 h-4 animate-spin" />
                    Sending...
                  </>
                ) : (
                  <>
                    <Mail className="w-4 h-4" />
                    Send Invites
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