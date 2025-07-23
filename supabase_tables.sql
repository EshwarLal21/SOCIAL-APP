-- USERS TABLE
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    bio TEXT,
    location TEXT,
    profilepic TEXT,
    banner TEXT CHECK (banner IN ('gold', 'silver', 'bronze', 'guest')) DEFAULT 'guest',
    usertype TEXT CHECK (usertype IN ('guest', 'employer', 'serviceprovider', 'admin')) DEFAULT 'guest',
    following INTEGER DEFAULT 0,
    followers INTEGER DEFAULT 0,
    createdat TIMESTAMP DEFAULT now()
);

-- BLOGS TABLE
CREATE TABLE blogs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    userid UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    location TEXT,
    image TEXT,
    category TEXT CHECK (category IN ('festivals', 'culture', 'travel', 'tech', 'sports', 'fashion', 'beauty', 'events', 'others', 'all')) NOT NULL,
    blograting FLOAT DEFAULT 0,
    createdat TIMESTAMP DEFAULT now()
);

-- COMMENTS TABLE
CREATE TABLE comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    userid UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    blogid UUID NOT NULL REFERENCES blogs(id) ON DELETE CASCADE,
    comment TEXT NOT NULL,
    parentid UUID REFERENCES comments(id) ON DELETE CASCADE,
    createdat TIMESTAMP DEFAULT now()
);

-- JOBS TABLE
CREATE TABLE jobs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    userid UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    jobtitle TEXT NOT NULL,
    jobdesc TEXT NOT NULL,
    joblocation TEXT NOT NULL,
    contact TEXT NOT NULL,
    slots INTEGER DEFAULT 1,
    salary FLOAT DEFAULT 0,
    postduration TIMESTAMP NOT NULL,
    createdat TIMESTAMP DEFAULT now()
);

-- SERVICES TABLE
CREATE TABLE services (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    userid UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    company TEXT NOT NULL,
    servicedesc TEXT NOT NULL,
    companylocation TEXT NOT NULL,
    serviceimage TEXT,
    servicetype TEXT CHECK (servicetype IN ('food', 'health', 'education', 'electronics', 'construction', 'automotive', 'entertainment', 'others', 'all')) NOT NULL,
    salary FLOAT DEFAULT 0,
    servicerating FLOAT DEFAULT 0,
    contact TEXT NOT NULL,
    createdat TIMESTAMP DEFAULT now()
);

-- NOTIFICATIONS TABLE
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    userid UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    message TEXT NOT NULL,
    isread BOOLEAN DEFAULT FALSE,
    createdat TIMESTAMP DEFAULT now()
);

-- REPORTS TABLE
CREATE TABLE reports (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    userid UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    contentid UUID NOT NULL,
    contenttype TEXT CHECK (contenttype IN ('blog', 'job', 'service', 'user')) NOT NULL,
    reason TEXT NOT NULL,
    createdat TIMESTAMP DEFAULT now()
);

-- FOLLOWS TABLE (added based on repository code)
CREATE TABLE follows (
    follower_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    followed_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    createdat TIMESTAMP DEFAULT now(),
    PRIMARY KEY (follower_id, followed_id)
);