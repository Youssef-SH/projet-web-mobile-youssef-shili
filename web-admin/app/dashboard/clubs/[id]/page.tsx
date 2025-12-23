"use client";

import { useState } from "react";
import { useParams, useRouter } from "next/navigation";
import {
  ChevronLeft,
  ChevronDown,
  ChevronUp,
  Users,
  Info,
} from "lucide-react";

// Mock club data
const clubsData: Record<string, any> = {
  cpu: {
    name: "CPU Club",
    photos: ["/clubs/cpu-1.jpg", "/clubs/cpu-2.jpg", "/clubs/cpu-3.jpg"],
    team: [
      { 
        name: "Ahmed Ben Ali", 
        role: "President",
        email: "ahmed.benali@isimm.tn",
        phone: "+216 22 123 456",
        studyLevel: "ING3"
      },
      { 
        name: "Fatma Mansouri", 
        role: "Vice President",
        email: "fatma.mansouri@isimm.tn",
        phone: "+216 23 456 789",
        studyLevel: "ING2"
      },
    ],
    info: {
      founded: "2018",
      description:
        "CPU Club focuses on promoting computer science and programming skills among students through workshops, hackathons, and coding competitions.",
      mainActivity: "Programming workshops, Hackathons, Technical training",
      email: "cpu@isimm.tn",
    },
    posts: [
      {
        id: 1,
        content:
          "Continuing our robotics journey on Day 2! 🤖 \n We moved from concepts to creation , building our first line-follower robots! 🚀Step by step, we're getting closer to mastery! 💪",
        image: "/posts/cpu1.jpg",
        date: "4 days ago",
      },
      {
        id: 2,
        content:
          "Weekend well spent! 💪 Our Problem Solving Contest was full of creativity and challenges✨ Congrats to all participants for their amazing work and great spirit! 🙌",
        image: "/posts/cpu2.jpg",
        date: "1 week ago",
      },
      {
        id: 3,
        content:
          "🚀 Ready to challenge your mind?Join our Solo Problem-Solving Contest and show off your coding and logic skills! 💡💸 Cash prizes await the winners!🎟️ Free registration don't miss out!⚠️ The number of participants is limited, so make sure to register early!📍 The contest will be held in person on October 18 be there at 2:30 PM!💻 Bring your own laptop, and if you have an extension cord, bring it along too! ⚡",
        image: "/posts/cpu3.jpg",
        date: "1 week ago",
      },
    ],
  },
  ieee: {
    name: "IEEE ISIMM",
    photos: ["/clubs/ieee-1.jpg", "/clubs/ieee-2.jpg", "/clubs/ieee-3.jpg"],
    team: [
      { 
        name: "Karim Jebali", 
        role: "President",
        email: "karim.jebali@isimm.tn",
        phone: "+216 24 567 890",
        studyLevel: "ING3"
      },
      { 
        name: "Nour Bouazizi", 
        role: "Vice President",
        email: "nour.bouazizi@isimm.tn",
        phone: "+216 25 678 901",
        studyLevel: "ING2"
      },
    ],
    info: {
      founded: "2015",
      description:
        "IEEE Student Branch at ISIMM dedicated to advancing technology for humanity. We organize technical workshops, conferences, and networking events.",
      mainActivity: "Technical workshops, IEEE conferences, Networking events",
      email: "ieee@isimm.tn",
    },
    posts: [
      {
        id: 1,
        content:
          "🎉 IEEE Day 2025 — Second Wave of Highlights!The celebration continues! 💙 Here’s another look at the laughter, teamwork, and inspiring spirit that made our IEEE Day unforgettable.Every photo tells a story of innovation, passion, and connection — thank you to everyone who made it special!",
        image: "/posts/ieee1.jpg",
        date: "3 days ago",
      },
      {
        id: 2,
        content:
          "We are proud to introduce Wajdy bouon, our IEEE ISIMM SB ambassador for the IEEE IAS 60th Anniversary Conference! 💚💚",
        image: "/posts/ieee2.jpg",
        date: "1 week ago",
      },
      {
        id: 3,
        content:
          "From the spark of an idea in 2019 to a thriving community of innovators, dreamers, and changemakers our journey has been nothing short of magical. 🌟💡 Every challenge faced, every project built, and every connection made has shaped us into the force we are today. 🚀💙Here’s to another year of pushing boundaries, inspiring minds, and making the impossible possible! 🌍💫Happy Anniversary, IEEE ISIMM SB! 🏆🎂",
        image: "/posts/ieee3.jpg",
        date: "1 week ago",
      },
    ],
  },
  arsii: {
    name: "ARSII",
    photos: [
      "/clubs/arsii-1.jpg",
      "/clubs/arsii-2.jpg",
      "/clubs/arsii-3.jpg",
    ],
    team: [
      { 
        name: "Sami Hammami", 
        role: "President",
        email: "sami.hammami@isimm.tn",
        phone: "+216 26 789 012",
        studyLevel: "ING3"
      },
      { 
        name: "Leila Dridi", 
        role: "Vice President",
        email: "leila.dridi@isimm.tn",
        phone: "+216 27 890 123",
        studyLevel: "ING2"
      },
    ],
    info: {
      founded: "2024",
      description:
        "ARSII promotes innovation and research in information systems and engineering.",
      mainActivity:
        "Research projects, Innovation contests, Industry partnerships",
      email: "arsii@isimm.tn",
    },
    posts: [
      {
        id: 1,
        content:
          "✨𝑨𝑹𝑺𝑰𝑰_𝑰𝑺𝑰𝑴𝑴 𝑪𝑳𝑼𝑩 𝒔𝒑𝒊𝒓𝒊𝒕 𝒊𝒔 𝒄𝒐𝒎𝒊𝒏𝒈 𝒂𝒍𝒊𝒗𝒆✨Join us for a Team Building afternoon packed with energy, laughter, and teamwork🎯📆 This Friday, October 31st⏰ at 4 PM📍at ISIMM",
        image: "/posts/arsii1.jpg",
        date: "4 days ago",
      },
      {
        id: 2,
        content:
          "🌟 A Beautiful Journey Comes to an End : AI Workshops 2025 🌟A huge thank you to our outstanding expert, Mrs. Imen Masmoudi! 🙏✨It was an incredible adventure diving deep into the world of Artificial Intelligence 🤖💡 , from the basics to the most advanced topics.📚 During this journey, we explored fascinating subjects such as:🔹 Supervised Machine Learning🔹 Computer Vision🔹 Keras-CV Object Detection🔹 Time Series Analysis🔹 Natural Language Processing (NLP)🔹 Ensemble Methods🔹 Generative AI🔹 RAG (Retrieval-Augmented Generation)Your guidance, passion, and dedication made this experience truly unforgettable. ❤️🙌We are beyond grateful to have learned from you and shared this journey together! 🚀",
        image: "/posts/arsii2.jpg",
        date: "4 days ago",
      },
      
    ],
  },
  cri: {
    name: "CRI ISIMM",
    photos: [
      "/clubs/cri-1.jpg",
      "/clubs/cri-2.jpg",
      "/clubs/cri-3.jpg",
    ],
    team: [
      { 
        name: "Mehdi Gharbi", 
        role: "President",
        email: "mehdi.gharbi@isimm.tn",
        phone: "+216 28 901 234",
        studyLevel: "ING3"
      },
      { 
        name: "Yasmine Toumi", 
        role: "Vice President",
        email: "yasmine.toumi@isimm.tn",
        phone: "+216 29 012 345",
        studyLevel: "ING2"
      },
    ],
    info: {
      founded: "2019",
      description:
        "Building the future through robotics and automation. We design, build, and compete with robots.",
      mainActivity: "Robot building, Competitions, Automation workshops",
      email: "robotics@isimm.tn",
    },
    posts: [
      {
        id: 1,
        content:
          "Looking back at Crifest fills us with so much joy! 🌟 A day full of knowledge, creativity, and collaboration. ",
        image: "/posts/cri1.jpg",
        date: "6 days ago",
      },
      {
        id: 2,
        content:
          "CRIFEST V3.0 Registrations Are Open! 📢Dive into the world of innovation and level up your skills! Join us for CRIFEST V3.0 on October 25th at 1:45PM at ISIMM, a day full of hands-on training sessions, including Arduino and STM32 workshops, perfect for all tech enthusiasts! ❤️‍🔥✨Select your session, register now, and secure your spot for an unforgettable learning experience. 🤖❤️ ",
        image: "/posts/cri2.jpg",
        date: "6 days ago",
      },
      {
        id: 3,
        content:
          "Our Integration Day was a blast! 🎉We loved meeting all the new members and catching up with our returning ones. The journey has just begun get ready for an incredible year ahead! 🚀✨",
        image: "/posts/cri3.jpg",
        date: "6 days ago",
      },
    ],
  },
  atia: {
    name: "ATIA ISIMM",
    photos: ["/clubs/atia-1.jpg", "/clubs/atia-2.jpg", "/clubs/atia-3.jpg"],
    team: [
      { 
        name: "Fares Aloulou", 
        role: "President",
        email: "fares.aloulou@isimm.tn",
        phone: "+216 20 123 456",
        studyLevel: "ING3"
      },
      { 
        name: "Sarah Ben Amor", 
        role: "Vice President",
        email: "sarah.benamor@isimm.tn",
        phone: "+216 21 234 567",
        studyLevel: "ING2"
      },
    ],
    info: {
      founded: "2020",
      description:
        "Exploring the frontiers of artificial intelligence and machine learning through projects and research.",
      mainActivity: "AI research, ML workshops, Data science projects",
      email: "ai@isimm.tn",
    },
    posts: [
      {
        id: 1,
        content:
          "Throwback to AI Horizons 3.0 – a day of innovation, inspiration, and unforgettable moments! ✨",
        image: "/posts/atia1.jpg",
        date: "2 days ago",
      },
      {
        id: 2,
        content:
          "🎉 Another successful event in the books! ATIA Club ISIMM is excited to share the highlights from Session 1 of our Neural Networks Beneath the Black Box series.During this engaging session, we explored key concepts that unveiled the inner workings of neural networks, sparking curiosity and deep discussions. 🔍🤖",
        image: "/posts/atia2.jpg",
        date: "2 days ago",
      },
    ],
  },
  binary: {
    name: "Binary Beats",
    photos: [
      "/clubs/binary-1.jpg",
      "/clubs/binary-2.jpg",
      "/clubs/binary-3.jpg",
    ],
    team: [
      { 
        name: "Ines Ferchichi", 
        role: "President",
        email: "ines.ferchichi@isimm.tn",
        phone: "+216 22 345 678",
        studyLevel: "ING3"
      },
      { 
        name: "Moez Abidi", 
        role: "Vice President",
        email: "moez.abidi@isimm.tn",
        phone: "+216 23 456 789",
        studyLevel: "ING2"
      },
    ],
    info: {
      founded: "2016",
      description:
        "Developing critical thinking, public speaking, and argumentation skills through debates and discussions.",
      mainActivity: "Debate competitions, Public speaking, Critical thinking",
      email: "debate@isimm.tn",
    },
    posts: [
      {
        id: 1,
        content:
          "Get ready to experience Rhythms & Riddles – a day of music, fun, and unforgettable memories! Join us on November 13th at ISIMM, starting at 4:30 PM, for a musical journey inspired by your favorite Spacetoon characters and vibes! 🚀🎤Don’t miss out on the excitement, surprises, and pure nostalgia – see you there! 🌟",
        image: "/posts/binary1.jpg",
        date: "5 days ago",
      },
      {
        id: 2,
        content:
          "Ne manquez pas cet événement ! Rejoignez-nous à notre réunion générale de Binary Beats.Des moments passionnants vous attendent, soyez nombreux ! ✨",
        image: "/posts/binary2.jpg",
        date: "5 days ago",
      },
    ],
  },
  microsoft: {
    name: "Microsoft ISIMM",
    photos: [
      "/clubs/microsoft-1.jpg",
      "/clubs/microsoft-2.jpg",
      "/clubs/microsoft-3.jpg",
    ],
    team: [
      { 
        name: "Amina Trabelsi", 
        role: "President",
        email: "amina.trabelsi@isimm.tn",
        phone: "+216 24 567 890",
        studyLevel: "ING3"
      },
      { 
        name: "Firas Ben Mansour", 
        role: "Vice President",
        email: "firas.benmansour@isimm.tn",
        phone: "+216 25 678 901",
        studyLevel: "ING2"
      },
    ],
    info: {
      founded: "2014",
      description:
        "Celebrating diversity and promoting cultural awareness through events, performances, and exhibitions.",
      mainActivity: "Cultural events, Performances, Art exhibitions",
      email: "culture@isimm.tn",
    },
    posts: [
      {
        id: 1,
        content:
          "[⚙️ 𝕋𝕣𝕒𝕚𝕟𝕚𝕟𝕘 𝕊𝕖𝕤𝕤𝕚𝕠𝕟 — ℂ𝕠𝕞𝕡𝕝𝕖𝕩𝕚𝕥𝕪 𝔸𝕟𝕒𝕝𝕪𝕤𝕚𝕤]✨𝐔𝐧𝐝𝐞𝐫𝐬𝐭𝐚𝐧𝐝 𝐡𝐨𝐰 𝐭𝐨 𝐦𝐞𝐚𝐬𝐮𝐫𝐞 𝐭𝐡𝐞 𝐞𝐟𝐟𝐢𝐜𝐢𝐞𝐧𝐜𝐲 𝐨𝐟 𝐲𝐨𝐮𝐫 𝐜𝐨𝐝𝐞.✨🧠𝐋𝐞𝐚𝐫𝐧 𝐭𝐨 𝐝𝐨𝐦𝐢𝐧𝐚𝐭𝐞 𝐭𝐡𝐞 𝐓𝐢𝐦𝐞 & 𝐒𝐩𝐚𝐜𝐞 𝐂𝐨𝐦𝐩𝐥𝐞𝐱𝐢𝐭𝐲 𝐠𝐚𝐦𝐞.🕒",
        image: "/posts/microsoft1.jpg",
        date: "1 week ago",
      },
      {
        id: 2,
        content:
          "[🏆 𝕮𝕠𝕕𝕖𝔸𝕣𝕖𝕟𝕒 — 𝕿𝖔𝖕 𝕱𝖎𝖛𝖊 𝕮𝖔𝖉𝖊𝖗𝖘 ⚡]Meet our Top 5 Coders who shone in CodeArena, the first contest of the year! 💻🔥Their skill, focus, and determination earned them a spot at the top.",
        image: "/posts/microsoft2.jpg",
        date: "1 week ago",
      },
    ],
  },
};

export default function ClubProfilePage() {
  const params = useParams();
  const router = useRouter();
  const clubId = params.id as string;
  const club = clubsData[clubId];

  const [currentPhotoIndex, setCurrentPhotoIndex] = useState(0);
  const [showTeam, setShowTeam] = useState(false);
  const [showInfo, setShowInfo] = useState(false);

  if (!club) {
    return (
      <div className="p-6">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-gray-900">Club not found</h2>
          <button
            onClick={() => router.push("/dashboard/clubs")}
            className="mt-4 text-blue-600 hover:underline"
          >
            Back to Clubs
          </button>
        </div>
      </div>
    );
  }

  const nextPhoto = () => {
    setCurrentPhotoIndex((prev) =>
      prev === club.photos.length - 1 ? 0 : prev + 1
    );
  };

  const prevPhoto = () => {
    setCurrentPhotoIndex((prev) =>
      prev === 0 ? club.photos.length - 1 : prev - 1
    );
  };

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Back Button */}
      <div className="bg-white border-b border-gray-200 px-6 py-4">
        <button
          onClick={() => router.push("/dashboard/clubs")}
          className="flex items-center gap-2 text-gray-600 hover:text-gray-900 transition-colors"
        >
          <ChevronLeft className="w-5 h-5" />
          <span className="font-medium">Back to Clubs</span>
        </button>
      </div>

      <div className="max-w-4xl mx-auto p-6 space-y-6">
        {/* Club Header with Logo */}
        <div className="bg-white rounded-2xl shadow-sm border border-gray-200 p-4 flex justify-center">
          <img
            src={`/clubs/${clubId}.jpg`}
            alt={`${club.name} logo`}
            className="h-16 w-auto object-contain"
          />
        </div>

        {/* Photo Gallery */}
        <div className="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden">
          <div className="relative h-96">
            {/* Current Photo */}
            <img
              src={club.photos[currentPhotoIndex]}
              alt={`${club.name} activity ${currentPhotoIndex + 1}`}
              className="w-full h-full object-cover"
            />

            {/* Overlay for photo counter */}
            <div className="absolute top-4 right-4 bg-black/50 text-white px-4 py-2 rounded-full text-sm font-semibold">
              {currentPhotoIndex + 1} / {club.photos.length}
            </div>

            {/* Navigation Buttons */}
            <button
              onClick={prevPhoto}
              className="absolute left-4 top-1/2 -translate-y-1/2 bg-white/90 hover:bg-white p-3 rounded-full shadow-lg transition-all"
            >
              <ChevronLeft className="w-6 h-6 text-gray-900" />
            </button>
            <button
              onClick={nextPhoto}
              className="absolute right-4 top-1/2 -translate-y-1/2 bg-white/90 hover:bg-white p-3 rounded-full shadow-lg transition-all"
            >
              <ChevronLeft className="w-6 h-6 text-gray-900 rotate-180" />
            </button>

            {/* Photo Indicators */}
            <div className="absolute bottom-4 left-1/2 -translate-x-1/2 flex gap-2">
              {club.photos.map((_: any, index: number) => (
                <button
                  key={index}
                  onClick={() => setCurrentPhotoIndex(index)}
                  className={`w-2 h-2 rounded-full transition-all ${
                    index === currentPhotoIndex
                      ? "bg-white w-8"
                      : "bg-white/50"
                  }`}
                />
              ))}
            </div>
          </div>
        </div>

        {/* Club Team Dropdown */}
        <div className="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden">
          <button
            onClick={() => setShowTeam(!showTeam)}
            className="w-full px-6 py-4 flex items-center justify-between hover:bg-gray-50 transition-colors"
          >
            <div className="flex items-center gap-3">
              <Users className="w-5 h-5 text-blue-600" />
              <span className="text-lg font-semibold text-gray-900">
                Club Team
              </span>
            </div>
            {showTeam ? (
              <ChevronUp className="w-5 h-5 text-gray-600" />
            ) : (
              <ChevronDown className="w-5 h-5 text-gray-600" />
            )}
          </button>

          {showTeam && (
            <div className="px-6 pb-6 space-y-4">
              {club.team.map((member: any, index: number) => (
                <div
                  key={index}
                  className="py-4 border-b border-gray-100 last:border-0"
                >
                  <div className="flex items-center justify-between mb-3">
                    <span className="font-bold text-lg text-gray-900">
                      {member.name}
                    </span>
                    <span className="text-sm text-blue-600 bg-blue-50 px-3 py-1 rounded-full font-semibold">
                      {member.role}
                    </span>
                  </div>
                  <div className="space-y-2 text-sm text-gray-600">
                    <div className="flex items-center gap-2">
                      <span className="font-semibold">Email:</span>
                      <span className="text-blue-600">{member.email}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <span className="font-semibold">Phone:</span>
                      <span>{member.phone}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <span className="font-semibold">Study Level:</span>
                      <span>{member.studyLevel}</span>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Club Info Dropdown */}
        <div className="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden">
          <button
            onClick={() => setShowInfo(!showInfo)}
            className="w-full px-6 py-4 flex items-center justify-between hover:bg-gray-50 transition-colors"
          >
            <div className="flex items-center gap-3">
              <Info className="w-5 h-5 text-purple-600" />
              <span className="text-lg font-semibold text-gray-900">
                Club Info
              </span>
            </div>
            {showInfo ? (
              <ChevronUp className="w-5 h-5 text-gray-600" />
            ) : (
              <ChevronDown className="w-5 h-5 text-gray-600" />
            )}
          </button>

          {showInfo && (
            <div className="px-6 pb-6 space-y-4">
              <div>
                <h4 className="text-sm font-semibold text-gray-600 mb-1">
                  Founded
                </h4>
                <p className="text-gray-900">{club.info.founded}</p>
              </div>
              <div>
                <h4 className="text-sm font-semibold text-gray-600 mb-1">
                  Description
                </h4>
                <p className="text-gray-900">{club.info.description}</p>
              </div>
              <div>
                <h4 className="text-sm font-semibold text-gray-600 mb-1">
                  Main Activity
                </h4>
                <p className="text-gray-900">{club.info.mainActivity}</p>
              </div>
              <div>
                <h4 className="text-sm font-semibold text-gray-600 mb-1">
                  Email
                </h4>
                <p className="text-blue-600">{club.info.email}</p>
              </div>
            </div>
          )}
        </div>

        {/* Posts Feed */}
        <div className="space-y-4">
          <h2 className="text-2xl font-bold text-gray-900">Recent Posts</h2>

          {club.posts.map((post: any) => (
            <div
              key={post.id}
              className="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden"
            >
              {/* Post Content */}
              <div className="p-6">
                <p className="text-gray-900 leading-relaxed">{post.content}</p>
              </div>

              {/* Post Image */}
              {post.image && (
                <img
                  src={post.image}
                  alt="Post"
                  className="w-full h-auto object-contain"
                />
              )}

              {/* Post Date */}
              <div className="px-6 py-4 border-t border-gray-100">
                <span className="text-sm text-gray-500">{post.date}</span>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}