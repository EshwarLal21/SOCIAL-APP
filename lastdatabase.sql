-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.blog_bookmarks (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  blogid uuid,
  userid uuid,
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT blog_bookmarks_pkey PRIMARY KEY (id),
  CONSTRAINT blog_bookmarks_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id),
  CONSTRAINT blog_bookmarks_blogid_fkey FOREIGN KEY (blogid) REFERENCES public.blogs(id)
);
CREATE TABLE public.blog_likes (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  blog_id uuid,
  user_id uuid,
  created_at timestamp with time zone DEFAULT now(),
  CONSTRAINT blog_likes_pkey PRIMARY KEY (id),
  CONSTRAINT blog_likes_blog_id_fkey FOREIGN KEY (blog_id) REFERENCES public.blogs(id),
  CONSTRAINT blog_likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id)
);
CREATE TABLE public.blog_reports (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  blogid uuid,
  userid uuid,
  reason text,
  created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT blog_reports_pkey PRIMARY KEY (id),
  CONSTRAINT blog_reports_blogid_fkey FOREIGN KEY (blogid) REFERENCES public.blogs(id),
  CONSTRAINT blog_reports_userid_fkey FOREIGN KEY (userid) REFERENCES auth.users(id)
);
CREATE TABLE public.blogratings (
  blogid uuid NOT NULL,
  userid uuid NOT NULL,
  rating integer NOT NULL,
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT blogratings_pkey PRIMARY KEY (blogid, userid),
  CONSTRAINT blogratings_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id),
  CONSTRAINT blogratings_blogid_fkey FOREIGN KEY (blogid) REFERENCES public.blogs(id)
);
CREATE TABLE public.blogs (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  userid uuid NOT NULL,
  title text NOT NULL,
  description text NOT NULL,
  location text,
  image text,
  category text NOT NULL CHECK (category = ANY (ARRAY['festivals'::text, 'culture'::text, 'travel'::text, 'tech'::text, 'sports'::text, 'fashion'::text, 'beauty'::text, 'events'::text, 'others'::text, 'all'::text])),
  blograting double precision DEFAULT 0,
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT blogs_pkey PRIMARY KEY (id),
  CONSTRAINT blogs_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id)
);
CREATE TABLE public.comments (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  userid uuid NOT NULL,
  blogid uuid NOT NULL,
  comment text NOT NULL,
  parentid uuid,
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT comments_pkey PRIMARY KEY (id),
  CONSTRAINT comments_parentid_fkey FOREIGN KEY (parentid) REFERENCES public.comments(id),
  CONSTRAINT comments_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id),
  CONSTRAINT comments_blogid_fkey FOREIGN KEY (blogid) REFERENCES public.blogs(id)
);
CREATE TABLE public.favorites (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  userid uuid NOT NULL,
  postid uuid NOT NULL,
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT favorites_pkey PRIMARY KEY (id),
  CONSTRAINT favorites_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id),
  CONSTRAINT favorites_postid_fkey FOREIGN KEY (postid) REFERENCES public.blogs(id)
);
CREATE TABLE public.follows (
  follower_id uuid NOT NULL,
  followed_id uuid NOT NULL,
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT follows_pkey PRIMARY KEY (follower_id, followed_id),
  CONSTRAINT follows_followed_id_fkey FOREIGN KEY (followed_id) REFERENCES public.users(id),
  CONSTRAINT follows_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public.users(id)
);
CREATE TABLE public.job_applications (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  jobid uuid NOT NULL,
  userid uuid NOT NULL,
  message text,
  cv_url text,
  status text DEFAULT 'applied'::text CHECK (status = ANY (ARRAY['applied'::text, 'accepted'::text, 'rejected'::text, 'completed'::text])),
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT job_applications_pkey PRIMARY KEY (id),
  CONSTRAINT job_applications_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id),
  CONSTRAINT job_applications_jobid_fkey FOREIGN KEY (jobid) REFERENCES public.jobs(id)
);
CREATE TABLE public.jobs (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  userid uuid NOT NULL,
  jobtitle text NOT NULL,
  jobdesc text NOT NULL,
  joblocation text NOT NULL,
  contact text NOT NULL,
  slots integer DEFAULT 1,
  salary double precision DEFAULT 0,
  postduration timestamp without time zone NOT NULL,
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT jobs_pkey PRIMARY KEY (id),
  CONSTRAINT jobs_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id)
);
CREATE TABLE public.messages (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  sender_id uuid NOT NULL,
  receiver_id uuid NOT NULL,
  content text NOT NULL,
  is_read boolean NOT NULL DEFAULT false,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT messages_pkey PRIMARY KEY (id),
  CONSTRAINT messages_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES auth.users(id),
  CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES auth.users(id)
);
CREATE TABLE public.notifications (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  userid uuid NOT NULL,
  message text NOT NULL,
  isread boolean DEFAULT false,
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT notifications_pkey PRIMARY KEY (id),
  CONSTRAINT notifications_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id)
);
CREATE TABLE public.reports (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  userid uuid NOT NULL,
  contentid uuid NOT NULL,
  contenttype text NOT NULL CHECK (contenttype = ANY (ARRAY['blog'::text, 'job'::text, 'service'::text, 'user'::text])),
  reason text NOT NULL,
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT reports_pkey PRIMARY KEY (id),
  CONSTRAINT reports_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id)
);
CREATE TABLE public.service_applications (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  serviceid uuid NOT NULL,
  userid uuid NOT NULL,
  message text,
  status text DEFAULT 'applied'::text CHECK (status = ANY (ARRAY['applied'::text, 'approved'::text, 'rejected'::text])),
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT service_applications_pkey PRIMARY KEY (id),
  CONSTRAINT service_applications_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id),
  CONSTRAINT service_applications_serviceid_fkey FOREIGN KEY (serviceid) REFERENCES public.services(id)
);
CREATE TABLE public.servicerating (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  service_id uuid NOT NULL,
  user_id uuid NOT NULL,
  rating integer NOT NULL CHECK (rating >= 1 AND rating <= 5),
  created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp without time zone,
  CONSTRAINT servicerating_pkey PRIMARY KEY (id),
  CONSTRAINT servicerating_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id),
  CONSTRAINT servicerating_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id)
);
CREATE TABLE public.services (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  userid uuid NOT NULL,
  company text NOT NULL,
  servicedesc text NOT NULL,
  companylocation text NOT NULL,
  serviceimage text,
  servicetype text NOT NULL CHECK (servicetype = ANY (ARRAY['food'::text, 'health'::text, 'education'::text, 'electronics'::text, 'construction'::text, 'automotive'::text, 'entertainment'::text, 'others'::text, 'all'::text])),
  salary double precision DEFAULT 0,
  servicerating double precision DEFAULT 0,
  contact text NOT NULL,
  createdat timestamp without time zone DEFAULT now(),
  CONSTRAINT services_pkey PRIMARY KEY (id),
  CONSTRAINT services_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id)
);
CREATE TABLE public.upgrade_requests (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL,
  business_id text NOT NULL,
  status text DEFAULT 'pending'::text CHECK (status = ANY (ARRAY['pending'::text, 'approved'::text, 'rejected'::text])),
  requested_type text NOT NULL CHECK (requested_type = ANY (ARRAY['employer'::text, 'serviceprovider'::text])),
  created_at timestamp with time zone DEFAULT now(),
  reviewed_at timestamp with time zone,
  reviewed_by uuid,
  rejection_reason text,
  file_urls ARRAY DEFAULT '{}'::text[],
  requested_value text,
  CONSTRAINT upgrade_requests_pkey PRIMARY KEY (id),
  CONSTRAINT upgrade_requests_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id),
  CONSTRAINT upgrade_requests_reviewed_by_fkey FOREIGN KEY (reviewed_by) REFERENCES auth.users(id)
);
CREATE TABLE public.users (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  username text NOT NULL UNIQUE,
  email text NOT NULL UNIQUE,
  bio text,
  location text,
  profilepic text,
  banner text DEFAULT 'guest'::text CHECK (banner = ANY (ARRAY['gold'::text, 'silver'::text, 'bronze'::text, 'guest'::text])),
  usertype text DEFAULT 'guest'::text CHECK (usertype = ANY (ARRAY['guest'::text, 'employer'::text, 'serviceprovider'::text, 'admin'::text])),
  following integer DEFAULT 1,
  followers integer DEFAULT 0,
  createdat timestamp without time zone DEFAULT now(),
  theme_mode text DEFAULT 'system'::text,
  notifications_enabled boolean DEFAULT false,
  credits integer DEFAULT 0,
  created_at timestamp with time zone DEFAULT now(),
  CONSTRAINT users_pkey PRIMARY KEY (id)
);