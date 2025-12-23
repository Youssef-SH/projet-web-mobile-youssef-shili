"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Building2 } from "lucide-react";

// Mock clubs data
const clubs = [
  {
    id: "cpu",
    name: "CPU Club",
    logo: "/clubs/cpu.jpg",
  },
  {
    id: "ieee",
    name: "IEEE ISIMM",
    logo: "/clubs/ieee.jpg",
  },
  {
    id: "arsii",
    name: "ARSII",
    logo: "/clubs/arsii.jpg",
  },
  {
    id: "cri",
    name: "CRI ISIMM",
    logo: "/clubs/cri.jpg",
  },
  {
    id: "atia",
    name: "ATIA ISIMM",
    logo: "/clubs/atia.jpg",
  },
  {
    id: "binary",
    name: "Binary Beats",
    logo: "/clubs/binary.jpg",
  },
  {
    id: "microsoft",
    name: "Microsoft ISIMM",
    logo: "/clubs/microsoft.jpg",
  },
];

export default function ClubsPage() {
  const router = useRouter();
  const [searchTerm, setSearchTerm] = useState("");

  const filteredClubs = clubs.filter((club) =>
    club.name.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const handleClubClick = (clubId: string) => {
    router.push(`/dashboard/clubs/${clubId}`);
  };

  return (
    <div className="p-6 space-y-6">
      {/* Page Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold text-gray-900">Clubs</h1>
          <p className="text-gray-600 mt-1">
            
          </p>
        </div>
        <div className="flex items-center gap-3">
          <div className="bg-white px-4 py-2 rounded-lg border border-gray-200">
            <span className="text-sm text-gray-600">Total Clubs:</span>
            <span className="ml-2 text-lg font-bold text-blue-600">
              {clubs.length}
            </span>
          </div>
        </div>
      </div>

      {/* Search Bar */}
      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <input
          type="text"
          placeholder="Search clubs..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      {/* Clubs Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
        {filteredClubs.map((club) => (
          <div
            key={club.id}
            onClick={() => handleClubClick(club.id)}
            className="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden cursor-pointer hover:shadow-lg transition-all duration-300 hover:-translate-y-1"
          >
            {/* Club Logo */}
            <div className="relative h-48 bg-gradient-to-br from-blue-500 to-purple-600">
              <div className="absolute inset-0 flex items-center justify-center">
                <div className="w-32 h-32 bg-white rounded-2xl shadow-lg overflow-hidden">
                  <img 
                    src={club.logo} 
                    alt={club.name}
                    className="w-full h-full object-cover"
                  />
                </div>
              </div>
            </div>

            {/* Club Info */}
            <div className="p-6">
              <h3 className="text-xl font-bold text-gray-900 text-center">
                {club.name}
              </h3>
            </div>
          </div>
        ))}
      </div>

      {/* No Results */}
      {filteredClubs.length === 0 && (
        <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-12 text-center">
          <Building2 className="w-16 h-16 text-gray-400 mx-auto mb-4" />
          <h3 className="text-lg font-semibold text-gray-900 mb-2">
            No clubs found
          </h3>
          <p className="text-gray-600">
            Try adjusting your search terms
          </p>
        </div>
      )}
    </div>
  );
}