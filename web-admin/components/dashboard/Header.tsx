"use client";

import { authAPI } from "@/lib/api/client";
import { useRouter } from "next/navigation";
import NotificationDropdown from "./NotificationDropDown";

export default function Header() {
  const router = useRouter();

  const user = authAPI.getStoredUser();

  return (
    <header className="bg-white border-b border-gray-200 sticky top-0 z-10 shadow-sm">
      <div className="px-6 py-3 flex items-center justify-between">
        <div></div>

        {/* Right Actions */}
        <div className="flex items-center space-x-3">
          <NotificationDropdown />

          {/* Divider */}
          <div className="h-8 w-px bg-gray-200" />

          {/* User Profile */}
          <div className="w-9 h-9 rounded-full overflow-hidden ring-2 ring-gray-100 group-hover:ring-gray-200 transition-all">
            <img
              src="/isimm.png"
              alt="User avatar"
              className="w-full h-full object-cover"
            />
          </div>
          <div className="hidden md:flex flex-col items-start">
            <span className="text-sm font-medium text-gray-900">
              {user?.email}
            </span>
            <span className="text-xs text-gray-500">{user?.role}</span>
          </div>
        </div>
      </div>
    </header>
  );
}
