import createClient from "openapi-fetch";
import type { paths } from "./clubhub-sdk";

export const api = createClient<paths>({
  baseUrl: process.env.NEXT_PUBLIC_API_URL,
});

// Helper to get stored token
const getToken = () => {
  if (typeof window === "undefined") return null;
  return localStorage.getItem("accessToken");
};

// Auth API
export const authAPI = {
  login: async (email: string, password: string, rememberMe: boolean) => {
    const { data, error } = await api.POST("/api/v1/auth/login", {
      body: { email, password, rememberMe },
    });
    if (error) throw error;

    // Store tokens
    if (typeof window !== "undefined") {
      const accessToken = data.data?.accessToken;
      const refreshToken = data.data?.refreshToken;
      const user = data.data?.user;

      if (accessToken) {
        localStorage.setItem("accessToken", accessToken);
      }
      if (refreshToken) {
        localStorage.setItem("refreshToken", refreshToken);
      }
      if (user) {
        localStorage.setItem("user", JSON.stringify(user));
      }
    }

    return data;
  },

  logout: async () => {
    const token = getToken();
    if (token) {
      const { error } = await api.POST("/api/v1/auth/logout", {
        headers: { Authorization: `Bearer ${token}` },
      });
      if (error) console.error("Logout error:", error);
    }

    if (typeof window !== "undefined") {
      localStorage.removeItem("accessToken");
      localStorage.removeItem("refreshToken");
      localStorage.removeItem("user");
    }
  },

  me: async () => {
    const token = getToken();
    const { data, error } = await api.GET("/api/v1/auth/me", {
      headers: { Authorization: `Bearer ${token}` },
    });
    if (error) throw error;
    return data;
  },

  getStoredUser: () => {
    if (typeof window === "undefined") return null;
    const userStr = localStorage.getItem("user");
    if (!userStr || userStr === "undefined" || userStr === "null") return null;

    try {
      return JSON.parse(userStr);
    } catch {
      console.error("Invalid user data in localStorage");
      return null;
    }
  },
};

// Users API
// export const usersAPI = {
//   list: async (params?: { offset?: number; limit?: number; role?: string; search?: string }) => {
//     const token = getToken();
//     const { data, error } = await api.GET('/api/', {
//       params: { query: params },
//       headers: { Authorization: `Bearer ${token}` },
//     });
//     if (error) throw error;
//     return data;
//   },

// getById: async (id: string) => {
//   const token = getToken();
//   const { data, error } = await api.GET('/users/{id}', {
//     params: { path: { id } },
//     headers: { Authorization: `Bearer ${token}` },
//   });
//   if (error) throw error;
//   return data;
// },

// update: async (id: string, body: any) => {
//   const token = getToken();
//   const { data, error } = await api.PATCH('/users/{id}', {
//     params: { path: { id } },
//     body,
//     headers: { Authorization: `Bearer ${token}` },
//   });
//   if (error) throw error;
//   return data;
// },

// deactivate: async (id: string) => {
//   const token = getToken();
//   const { data, error } = await api.POST('/users/{id}/deactivate', {
//     params: { path: { id } },
//     headers: { Authorization: `Bearer ${token}` },
//   });
//   if (error) throw error;
//   return data;
// },

//   delete: async (id: string) => {
//     const token = getToken();
//     const { error } = await api.DELETE('/users/{id}', {
//       params: { path: { id } },
//       headers: { Authorization: `Bearer ${token}` },
//     });
//     if (error) throw error;
//   },
// };

// Clubs API
export const clubsAPI = {
  list: async (params?: { offset?: number; limit?: number }) => {
    const token = getToken();

    const options: any = {
      headers: { Authorization: `Bearer ${token}` },
    };

    if (params) {
      options.params = { query: params };
    }

    const { data, error } = await api.GET("/api/v1/clubs", options);
    if (error) throw error;
    return data;
  },

  getById: async (id: string) => {
    const token = getToken();
    const { data, error } = await api.GET("/api/v1/clubs/{id}", {
      params: { path: { id } },
      headers: { Authorization: `Bearer ${token}` },
    });
    if (error) throw error;
    return data;
  },

  getLeaders: async (id: string) => {
    const token = getToken();
    const { data, error } = await api.GET("/api/v1/clubs/{id}/leaders", {
      params: { path: { id } },
      headers: { Authorization: `Bearer ${token}` },
    });
    if (error) throw error;
    return data;
  },

  updateName: async (id: string, name: string) => {
    const token = getToken();
    const { data, error } = await api.PATCH("/api/v1/clubs/{id}/name", {
      params: { path: { id } },
      body: { name },
      headers: { Authorization: `Bearer ${token}` },
    });
    if (error) throw error;
    return data;
  },
};

// Events API
// export const eventsAPI = {
//   listRequests: async (params?: { offset?: number; limit?: number; status?: string }) => {
//     const token = getToken();
//     const { data, error } = await api.GET('/api/v1/events/requests', {
//       params: { query: params },
//       headers: { Authorization: `Bearer ${token}` },
//     });
//     if (error) throw error;
//     return data;
//   },

// getRequest: async (id: string) => {
//   const token = getToken();
//   const { data, error } = await api.GET('/events/requests/{id}', {
//     params: { path: { id } },
//     headers: { Authorization: `Bearer ${token}` },
//   });
//   if (error) throw error;
//   return data;
// },

// approveRequest: async (id: string, comment?: string) => {
//   const token = getToken();
//   const { data, error } = await api.POST('/events/requests/{id}/approve', {
//     params: { path: { id } },
//     body: { comment },
//     headers: { Authorization: `Bearer ${token}` },
//   });
//   if (error) throw error;
//   return data;
// },

// rejectRequest: async (id: string, comment: string) => {
//   const token = getToken();
//   const { data, error } = await api.POST('/events/requests/{id}/reject', {
//     params: { path: { id } },
//     body: { comment },
//     headers: { Authorization: `Bearer ${token}` },
//   });
//   if (error) throw error;
//   return data;
// },

//  listEvents: async (params?: { from?: string; to?: string; clubId?: string }) => {
//     const token = getToken();
//     const { data, error } = await api.GET('/events/calendar', {
//       params: { query: params },
//       headers: { Authorization: `Bearer ${token}` },
//     });
//     if (error) throw error;
//     return data;
//   },
// };

// Invites API
export const invitesAPI = {
  //   preview: async (file: File, accountType: 'student' | 'club', mode: 'add' | 'replace') => {
  //     const token = getToken();
  //     const formData = new FormData();
  //     formData.append('file', file);

  //     const { data, error } = await api.POST('/api/v1/auth/invites/preview', {
  //       params: { query: { accountType, mode } },
  //       body: formData,
  //       headers: { Authorization: `Bearer ${token}` },
  //     });
  //     if (error) throw error;
  //     return data;
  //   },

  // bulk: async (file: File, accountType: 'student' | 'club', mode: 'add' | 'replace', confirm: string) => {
  //   const token = getToken();
  //   const formData = new FormData();
  //   formData.append('file', file);
  //   formData.append('confirm', confirm);

  //   const { data, error } = await api.POST('/api/v1/auth/invites/bulk', {
  //     params: { query: { accountType, mode } },
  //     body: formData,
  //     headers: { Authorization: `Bearer ${token}` },
  //   });
  //   if (error) throw error;
  //   return data;
  // },

  resend: async (emails: string[]) => {
    const token = getToken();
    const { data, error } = await api.POST("/api/v1/auth/invites/resend", {
      body: { emails },
      headers: { Authorization: `Bearer ${token}` },
    });
    if (error) throw error;
    return data;
  },
};
