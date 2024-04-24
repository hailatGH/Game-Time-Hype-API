--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.10.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.10.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone bigint DEFAULT 0 NOT NULL,
    "houseNo" character varying(255) NOT NULL,
    area character varying(255) NOT NULL,
    pincode bigint DEFAULT 0 NOT NULL,
    city character varying(255) NOT NULL,
    "stateId" smallint NOT NULL,
    "nearByLocation" character varying(255),
    "userId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: androidTokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."androidTokens" (
    "userId" uuid NOT NULL,
    token character varying(255) NOT NULL,
    "packageName" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."androidTokens" OWNER TO postgres;

--
-- Name: appleIds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."appleIds" (
    id character varying(255) NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."appleIds" OWNER TO postgres;

--
-- Name: appleTransactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."appleTransactions" (
    id integer NOT NULL,
    "transactionId" character varying(255) DEFAULT NULL::character varying,
    "originalTransactionId" character varying(255) DEFAULT NULL::character varying,
    "webOrderLineItemId" character varying(255) DEFAULT NULL::character varying,
    "bundleId" character varying(255) DEFAULT NULL::character varying,
    "productId" character varying(255) DEFAULT NULL::character varying,
    "subscriptionGroupIdentifier" character varying(255) DEFAULT NULL::character varying,
    "purchaseDate" timestamp with time zone,
    "originalPurchaseDate" timestamp with time zone,
    "expiresDate" timestamp with time zone,
    quantity smallint DEFAULT 0,
    type character varying(255) DEFAULT NULL::character varying,
    "appAccountToken" uuid,
    "inAppOwnershipType" character varying(255) DEFAULT NULL::character varying,
    "signedDate" timestamp with time zone,
    "autoRenewProductId" character varying(255) DEFAULT NULL::character varying,
    "autoRenewStatus" smallint DEFAULT 0,
    "recentSubscriptionStartDate" timestamp with time zone,
    "notificationType" character varying(255) DEFAULT NULL::character varying,
    subtype character varying(255) DEFAULT NULL::character varying,
    "notificationUUID" character varying(255) DEFAULT NULL::character varying,
    "bundleVersion" character varying(255) DEFAULT NULL::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."appleTransactions" OWNER TO postgres;

--
-- Name: appleTransactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."appleTransactions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."appleTransactions_id_seq" OWNER TO postgres;

--
-- Name: appleTransactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."appleTransactions_id_seq" OWNED BY public."appleTransactions".id;


--
-- Name: audioTracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."audioTracks" (
    id uuid NOT NULL,
    thumbnail character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    artist character varying(255) NOT NULL,
    item character varying(255) NOT NULL,
    category smallint NOT NULL,
    "userId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."audioTracks" OWNER TO postgres;

--
-- Name: baseballs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baseballs (
    id uuid NOT NULL,
    "gameName" character varying(255) NOT NULL,
    "plateAppearances" smallint DEFAULT 0 NOT NULL,
    singles smallint DEFAULT 0 NOT NULL,
    doubles smallint DEFAULT 0 NOT NULL,
    triples smallint DEFAULT 0 NOT NULL,
    homerun smallint DEFAULT 0 NOT NULL,
    runs smallint DEFAULT 0 NOT NULL,
    "strikeOut" smallint DEFAULT 0 NOT NULL,
    "baseOnBalls" smallint DEFAULT 0 NOT NULL,
    "hitByPitches" smallint DEFAULT 0 NOT NULL,
    rbi smallint DEFAULT 0 NOT NULL,
    "stolenBases" smallint DEFAULT 0 NOT NULL,
    "matchStatus" smallint DEFAULT 0,
    score smallint DEFAULT 0 NOT NULL,
    "userId" uuid,
    date date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.baseballs OWNER TO postgres;

--
-- Name: basketballs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basketballs (
    id uuid NOT NULL,
    "gameName" character varying(255) NOT NULL,
    pointers2 smallint DEFAULT 0 NOT NULL,
    pointers3 smallint DEFAULT 0 NOT NULL,
    "freeThrows" smallint DEFAULT 0 NOT NULL,
    rebounds smallint DEFAULT 0 NOT NULL,
    assists smallint DEFAULT 0 NOT NULL,
    steals smallint DEFAULT 0 NOT NULL,
    blocks smallint DEFAULT 0 NOT NULL,
    turnover smallint DEFAULT 0 NOT NULL,
    fouls smallint DEFAULT 0 NOT NULL,
    "matchStatus" smallint DEFAULT 0 NOT NULL,
    score smallint DEFAULT 0 NOT NULL,
    "userId" uuid,
    date date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.basketballs OWNER TO postgres;

--
-- Name: blacklistedUser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."blacklistedUser" (
    email character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."blacklistedUser" OWNER TO postgres;

--
-- Name: blocklists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blocklists (
    id uuid NOT NULL,
    "userId" uuid,
    "blockedUserId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.blocklists OWNER TO postgres;

--
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id uuid NOT NULL,
    "userId" uuid,
    "merchandiseId" uuid,
    qty smallint NOT NULL,
    size character varying(255) DEFAULT NULL::character varying,
    "subTotal" integer,
    shipping smallint,
    total integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "parentId" smallint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: challenges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenges (
    id uuid NOT NULL,
    "videoId" character varying(255) NOT NULL,
    "thumbnailId" character varying(255) NOT NULL,
    name character varying(255),
    "limit" smallint,
    description character varying(255),
    "userId" uuid,
    "isControversial" boolean DEFAULT false,
    "acceptedCounter" smallint DEFAULT 0,
    "like" bigint DEFAULT 0,
    "challengeId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.challenges OWNER TO postgres;

--
-- Name: challengesLikes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."challengesLikes" (
    id uuid NOT NULL,
    "userId" uuid,
    items json DEFAULT '{}'::json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."challengesLikes" OWNER TO postgres;

--
-- Name: communities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.communities (
    id uuid NOT NULL,
    "userId" uuid,
    "friendId" json DEFAULT '{}'::json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.communities OWNER TO postgres;

--
-- Name: countDownClocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."countDownClocks" (
    id uuid NOT NULL,
    "userId" uuid,
    items json DEFAULT '[]'::json NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."countDownClocks" OWNER TO postgres;

--
-- Name: emailInvitees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."emailInvitees" (
    id uuid NOT NULL,
    "teamId" uuid,
    "coachId" uuid,
    emails json DEFAULT '{}'::json NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."emailInvitees" OWNER TO postgres;

--
-- Name: fcms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fcms (
    "fcmToken" character varying(255) NOT NULL,
    "userId" uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.fcms OWNER TO postgres;

--
-- Name: footballs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footballs (
    id uuid NOT NULL,
    "gameName" character varying(255) NOT NULL,
    "rushingYards" smallint DEFAULT 0 NOT NULL,
    "passingYards" smallint DEFAULT 0 NOT NULL,
    "receivingYards" smallint DEFAULT 0 NOT NULL,
    "kickReturns" smallint DEFAULT 0 NOT NULL,
    sacks smallint DEFAULT 0 NOT NULL,
    tackles smallint DEFAULT 0 NOT NULL,
    blocks smallint DEFAULT 0 NOT NULL,
    catches smallint DEFAULT 0 NOT NULL,
    interception smallint DEFAULT 0 NOT NULL,
    "fieldGoals" integer DEFAULT 0 NOT NULL,
    conversions smallint DEFAULT 0 NOT NULL,
    touchdowns smallint DEFAULT 0 NOT NULL,
    "possessionTime" smallint DEFAULT 0,
    "matchStatus" smallint DEFAULT 0,
    score smallint DEFAULT 0 NOT NULL,
    "userId" uuid,
    date date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.footballs OWNER TO postgres;

--
-- Name: gamePractises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."gamePractises" (
    id uuid NOT NULL,
    date date NOT NULL,
    "practiseTime" numeric(10,2) NOT NULL,
    notes character varying(255),
    "userId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."gamePractises" OWNER TO postgres;

--
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    "playStoreLink" character varying(255) DEFAULT NULL::character varying,
    "appStoreLink" character varying(255) DEFAULT NULL::character varying,
    "categoryId" smallint NOT NULL,
    thumbnail character varying(255) NOT NULL,
    "userId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: getLatestMessages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."getLatestMessages" (
    id uuid NOT NULL,
    "userId" uuid,
    "senderId" uuid,
    "messageId" uuid,
    "groupId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."getLatestMessages" OWNER TO postgres;

--
-- Name: golfs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.golfs (
    id uuid NOT NULL,
    "gameName" character varying(255) NOT NULL,
    "golfHole" smallint DEFAULT 0 NOT NULL,
    "drivingDistance" smallint DEFAULT 0 NOT NULL,
    "drivingAccuracy" numeric(10,2) DEFAULT 0 NOT NULL,
    "carryingDistance" smallint DEFAULT 0 NOT NULL,
    "FairwaysRegulation" numeric(10,2) DEFAULT 0 NOT NULL,
    "greensRegulation" smallint DEFAULT 0 NOT NULL,
    "puttsPerRound" smallint DEFAULT 0 NOT NULL,
    handicap smallint DEFAULT 0 NOT NULL,
    "sandSaves" smallint DEFAULT 0 NOT NULL,
    eagles smallint DEFAULT 0 NOT NULL,
    birdies smallint DEFAULT 0 NOT NULL,
    pars smallint DEFAULT 0 NOT NULL,
    bogeys smallint DEFAULT 0 NOT NULL,
    "matchStatus" smallint DEFAULT 0 NOT NULL,
    score smallint DEFAULT 0 NOT NULL,
    "userId" uuid,
    date date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.golfs OWNER TO postgres;

--
-- Name: googleAds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."googleAds" (
    id integer NOT NULL,
    "appOpen" character varying(255) NOT NULL,
    banner character varying(255) NOT NULL,
    interstitial character varying(255) NOT NULL,
    "nativeAdvanced" character varying(255) NOT NULL,
    rewarded character varying(255) NOT NULL,
    "isAndroid" boolean DEFAULT true,
    status boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."googleAds" OWNER TO postgres;

--
-- Name: googleAds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."googleAds_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."googleAds_id_seq" OWNER TO postgres;

--
-- Name: googleAds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."googleAds_id_seq" OWNED BY public."googleAds".id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    "creatorId" uuid,
    "userList" json DEFAULT '{}'::json,
    "profileImage" character varying(255) DEFAULT NULL::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: hockeys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hockeys (
    id uuid NOT NULL,
    "gameName" character varying(255) NOT NULL,
    goals smallint DEFAULT 0,
    "penaltyMinutes" smallint DEFAULT 0,
    "timeOnIce" smallint DEFAULT 0,
    plus smallint DEFAULT 0,
    minus smallint DEFAULT 0,
    "faceOffPerc" numeric(10,2) DEFAULT 0,
    assists smallint DEFAULT 0,
    "emptyNetGoals" smallint DEFAULT 0,
    "overtimeLoss" smallint DEFAULT 0,
    "winningGoals" smallint DEFAULT 0,
    "otGoals" smallint DEFAULT 0,
    "playGoal" integer DEFAULT 0,
    points smallint DEFAULT 0,
    "shotsOnGoals" smallint DEFAULT 0,
    "shortHandedGoals" smallint DEFAULT 0,
    shutout smallint DEFAULT 0,
    saves smallint DEFAULT 0,
    "matchStatus" smallint DEFAULT 0,
    score smallint DEFAULT 0 NOT NULL,
    "userId" uuid,
    date date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.hockeys OWNER TO postgres;

--
-- Name: lacrosses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lacrosses (
    id uuid NOT NULL,
    "gameName" character varying(255) NOT NULL,
    goals smallint DEFAULT 0 NOT NULL,
    "minutesPlayed" integer DEFAULT 0 NOT NULL,
    "groundBalls" smallint DEFAULT 0 NOT NULL,
    "causedTurnover" smallint DEFAULT 0 NOT NULL,
    "blockedShot" smallint DEFAULT 0 NOT NULL,
    "shotsOnGoals" smallint DEFAULT 0 NOT NULL,
    "handedGoal" smallint DEFAULT 0 NOT NULL,
    clear smallint DEFAULT 0 NOT NULL,
    "turnOver" smallint DEFAULT 0,
    "faceOffsWon" smallint DEFAULT 0 NOT NULL,
    "faceOffsLoss" smallint DEFAULT 0 NOT NULL,
    "penaltyMinutes" smallint DEFAULT 0 NOT NULL,
    fouls smallint DEFAULT 0 NOT NULL,
    "gameWinningGoals" smallint DEFAULT 0 NOT NULL,
    saves smallint DEFAULT 0 NOT NULL,
    shutouts smallint DEFAULT 0 NOT NULL,
    "goalsAllowed" smallint DEFAULT 0 NOT NULL,
    "matchStatus" smallint DEFAULT 0 NOT NULL,
    assists smallint DEFAULT 0 NOT NULL,
    score smallint DEFAULT 0 NOT NULL,
    "userId" uuid,
    date date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.lacrosses OWNER TO postgres;

--
-- Name: matchVideos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."matchVideos" (
    id uuid NOT NULL,
    "videoId" character varying(255) NOT NULL,
    "thumbnailId" character varying(255) NOT NULL,
    title character varying(255),
    "creatorId" uuid,
    "teamId" uuid,
    date date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."matchVideos" OWNER TO postgres;

--
-- Name: merchandises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchandises (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    thumbnail character varying(255) NOT NULL,
    media json DEFAULT '[]'::json NOT NULL,
    "basePrice" integer NOT NULL,
    "discountPercentage" smallint NOT NULL,
    "discountedPrice" integer NOT NULL,
    quantity integer NOT NULL,
    "avlQuantity" integer NOT NULL,
    "categoryId" integer,
    "hasSizeAvailable" boolean DEFAULT false,
    s integer DEFAULT 0,
    m integer DEFAULT 0,
    l integer DEFAULT 0,
    xl integer DEFAULT 0,
    xxl integer DEFAULT 0,
    status boolean,
    "isDeleted" boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.merchandises OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id uuid NOT NULL,
    "userId" uuid,
    "senderId" uuid,
    "groupId" uuid,
    message character varying(255) NOT NULL,
    "hasRead" boolean DEFAULT false NOT NULL,
    "hasReads" json DEFAULT '{}'::json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modules (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255),
    path character varying(100),
    "moduleId" bigint,
    status boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.modules OWNER TO postgres;

--
-- Name: modules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modules_id_seq OWNER TO postgres;

--
-- Name: modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modules_id_seq OWNED BY public.modules.id;


--
-- Name: motivationalClips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."motivationalClips" (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    "videoId" character varying(255) NOT NULL,
    "thumbnailId" character varying(255) NOT NULL,
    "userId" uuid,
    "likeCount" integer DEFAULT 0,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."motivationalClips" OWNER TO postgres;

--
-- Name: motivationalClipsLikes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."motivationalClipsLikes" (
    id uuid NOT NULL,
    "userId" uuid,
    items json DEFAULT '{}'::json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."motivationalClipsLikes" OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id uuid NOT NULL,
    product json DEFAULT '{}'::json,
    address character varying(255) NOT NULL,
    "receiverName" character varying(255) NOT NULL,
    phone bigint DEFAULT 0 NOT NULL,
    "shippingAmount" integer DEFAULT 0 NOT NULL,
    "TotalAmount" bigint DEFAULT 0 NOT NULL,
    "paymentId" uuid,
    status smallint DEFAULT 1 NOT NULL,
    "userId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: parents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parents (
    id integer NOT NULL,
    "parentId" uuid,
    "childId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.parents OWNER TO postgres;

--
-- Name: parents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parents_id_seq OWNER TO postgres;

--
-- Name: parents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parents_id_seq OWNED BY public.parents.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id uuid NOT NULL,
    "stripeId" character varying(255),
    "paymentMethod" character varying(255) NOT NULL,
    amount bigint NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    "userId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: photoalbums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photoalbums (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    items json NOT NULL,
    "userId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.photoalbums OWNER TO postgres;

--
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    items json DEFAULT '{}'::json,
    "userId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- Name: postGameReviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."postGameReviews" (
    id uuid NOT NULL,
    "matchVideoId" uuid,
    notes json DEFAULT '{}'::json,
    ratings double precision DEFAULT '0'::double precision NOT NULL,
    "userId" uuid,
    date date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."postGameReviews" OWNER TO postgres;

--
-- Name: pregamegoals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pregamegoals (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    subtitle character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "userId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.pregamegoals OWNER TO postgres;

--
-- Name: premiumUsers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."premiumUsers" (
    "userId" uuid NOT NULL,
    "expiryDate" timestamp with time zone NOT NULL,
    "transactionId" character varying(255) NOT NULL,
    "productId" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."premiumUsers" OWNER TO postgres;

--
-- Name: refers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refers (
    id bigint NOT NULL,
    "userId" uuid,
    "referedUser" uuid,
    "referralCode" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.refers OWNER TO postgres;

--
-- Name: refers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refers_id_seq OWNER TO postgres;

--
-- Name: refers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refers_id_seq OWNED BY public.refers.id;


--
-- Name: refunds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refunds (
    id uuid NOT NULL,
    amount bigint NOT NULL,
    "userId" uuid,
    "paymentId" uuid,
    "orderId" uuid,
    "isRefunded" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.refunds OWNER TO postgres;

--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id uuid NOT NULL,
    "challengeId" uuid,
    "reasonId" smallint NOT NULL,
    reason character varying(255),
    "reportedUserId" uuid,
    "userId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedules (
    id uuid NOT NULL,
    type boolean DEFAULT false,
    name character varying(255) NOT NULL,
    description character varying(255),
    location character varying(255) NOT NULL,
    date_time timestamp with time zone NOT NULL,
    duration time without time zone,
    "arriveEarly" time without time zone,
    "teamId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.schedules OWNER TO postgres;

--
-- Name: shippingRates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."shippingRates" (
    amount smallint DEFAULT 0 NOT NULL,
    "userId" uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."shippingRates" OWNER TO postgres;

--
-- Name: soccers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.soccers (
    id uuid NOT NULL,
    "gameName" character varying(255) NOT NULL,
    "goalsScored" integer DEFAULT 0,
    assists smallint DEFAULT 0,
    "shotsToGoal" smallint DEFAULT 0,
    "timeOfPosition" smallint DEFAULT 0,
    fouls smallint DEFAULT 0,
    offsides smallint DEFAULT 0,
    touches integer DEFAULT 0,
    turnover smallint DEFAULT 0,
    "freeKick" smallint DEFAULT 0,
    "goalKick" smallint DEFAULT 0,
    "panaltyKick" smallint DEFAULT 0,
    "cornerKick" smallint DEFAULT 0,
    passes smallint DEFAULT 0,
    "matchStatus" smallint DEFAULT 0,
    "blockedGoals" smallint DEFAULT 0 NOT NULL,
    score smallint DEFAULT 0 NOT NULL,
    "userId" uuid,
    date date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.soccers OWNER TO postgres;

--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(500),
    "playlistId" uuid,
    "userId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: sports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sports (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.sports OWNER TO postgres;

--
-- Name: sports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sports_id_seq OWNER TO postgres;

--
-- Name: sports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sports_id_seq OWNED BY public.sports.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    id smallint NOT NULL,
    name character varying(255) NOT NULL,
    abbreviation character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id uuid NOT NULL,
    "teamProfile" character varying(255),
    name character varying(255) NOT NULL,
    description character varying(255),
    link character varying(255),
    members json DEFAULT '{}'::json,
    "creatorId" uuid,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: tennis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tennis (
    id uuid NOT NULL,
    "gameName" character varying(255) NOT NULL,
    aces smallint DEFAULT 0,
    "breakPoints" smallint DEFAULT 0,
    "doubleFaults" smallint DEFAULT 0,
    "servePercentage" numeric(10,2) DEFAULT 0,
    "winnersName" character varying(255) DEFAULT 0,
    "matchTime" integer DEFAULT 0,
    "pointsWon" smallint DEFAULT 0,
    "servicePointsWon" smallint DEFAULT 0,
    "setsWon" smallint DEFAULT 0,
    "receivingPointsWon" smallint DEFAULT 0,
    "playErrors" smallint DEFAULT 0,
    "matchStatus" smallint DEFAULT 0,
    score smallint DEFAULT 0 NOT NULL,
    "userId" uuid,
    date date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tennis OWNER TO postgres;

--
-- Name: userPermissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."userPermissions" (
    "userId" uuid NOT NULL,
    modules json DEFAULT '{}'::json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."userPermissions" OWNER TO postgres;

--
-- Name: userTeams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."userTeams" (
    id uuid NOT NULL,
    "userId" uuid,
    teams json DEFAULT '{}'::json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."userTeams" OWNER TO postgres;

--
-- Name: usergroupdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usergroupdetails (
    id uuid NOT NULL,
    "userId" uuid,
    "groupList" json DEFAULT '{}'::json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.usergroupdetails OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    fullname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255),
    signupvia integer,
    otp integer,
    otpvalid timestamp with time zone,
    gender smallint,
    age integer,
    "profileImagePath" character varying(255),
    "sportId" integer,
    "roleId" integer,
    status boolean DEFAULT false,
    "allowLocation" boolean,
    "referralCode" character varying(255),
    university character varying(255),
    "isAdmin" boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: volleyballs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volleyballs (
    id uuid NOT NULL,
    "gameName" character varying(255) NOT NULL,
    "blockSolo" smallint DEFAULT 0 NOT NULL,
    "blockingAssists" smallint DEFAULT 0 NOT NULL,
    assists smallint DEFAULT 0 NOT NULL,
    "handlingErrors" smallint DEFAULT 0 NOT NULL,
    dig smallint DEFAULT 0 NOT NULL,
    kills smallint DEFAULT 0 NOT NULL,
    "serviceAce" smallint DEFAULT 0 NOT NULL,
    "setsPlayed" smallint DEFAULT 0 NOT NULL,
    "pointsScored" smallint DEFAULT 0 NOT NULL,
    "Tackles" smallint DEFAULT 0 NOT NULL,
    "hittingAverage" smallint DEFAULT 0 NOT NULL,
    "totalAttempts" smallint DEFAULT 0 NOT NULL,
    "matchStatus" smallint DEFAULT 0 NOT NULL,
    score smallint DEFAULT 0 NOT NULL,
    "userId" uuid,
    date date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.volleyballs OWNER TO postgres;

--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: appleTransactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."appleTransactions" ALTER COLUMN id SET DEFAULT nextval('public."appleTransactions_id_seq"'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: googleAds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."googleAds" ALTER COLUMN id SET DEFAULT nextval('public."googleAds_id_seq"'::regclass);


--
-- Name: modules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modules ALTER COLUMN id SET DEFAULT nextval('public.modules_id_seq'::regclass);


--
-- Name: parents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parents ALTER COLUMN id SET DEFAULT nextval('public.parents_id_seq'::regclass);


--
-- Name: refers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refers ALTER COLUMN id SET DEFAULT nextval('public.refers_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: sports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sports ALTER COLUMN id SET DEFAULT nextval('public.sports_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, name, phone, "houseNo", area, pincode, city, "stateId", "nearByLocation", "userId", "createdAt", "updatedAt") FROM stdin;
1	golf player	2580250	123, sky house	awesome road pal	2580	zudio	4	yea	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-11 11:45:43.144+00	2023-04-11 11:45:43.144+00
2	temp user 1	99888777665	3 galaxy apt	orbit road	395555	ca	15	\N	74ca1b0a-82f9-4852-b8da-c1b33181a997	2023-04-11 12:03:37.506+00	2023-04-11 12:03:37.506+00
4	see invisible	9846543210	123 years 	The first road 	25809	sky	4	\N	657975cc-7b3e-49bd-8dc8-76e5cba3293f	2023-04-12 10:20:19.821+00	2023-04-12 10:20:19.821+00
5	The only 	3698521470	10, people unfollowed 	The new study 	25801	I’m going 	4	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-13 05:43:31.434+00	2023-04-13 05:43:31.434+00
7	sagar	835588	212 house number	area	222222	new york	32	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-19 07:14:29.828+00	2023-10-19 07:14:29.828+00
\.


--
-- Data for Name: androidTokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."androidTokens" ("userId", token, "packageName", "createdAt", "updatedAt") FROM stdin;
79254c3c-4ce5-48b5-8292-26a89ab2e122	igohemlfdecobdkmkkkjfici.AO-J1OzIQ4be3N-mOSow6HVRMhPZWOAR4RK4qWQ9rX9PALzNpbhL9Bn8iW5y061r6IUP0S7Z2T_KTwOyocO0q73pMq5b7ryyhw	com.gethype	2023-04-07 10:35:33.881+00	2023-04-07 10:35:33.881+00
74ca1b0a-82f9-4852-b8da-c1b33181a997	gmjijojbkkcajhohjonbdolj.AO-J1OwIICxTG0hAHyBJ_oW2QL8s1hwr2JVK8uzviQnXd-Il8yIQpHGhugmN8gd_KPgRybKqC10A-BxWYYpDdnKJEOeyABBeqA	com.gethype	2023-04-11 12:09:35.088+00	2023-04-11 12:09:35.088+00
1d0d6d8d-1c4b-4a93-82a3-079a8a860518	gocigbcilbdoeibpkealigkk.AO-J1OxFZH9U5_ZAp8SY4LscPKOvq_dm0xryLvx-bwokTPiwSRhKZAcyXzj7Gob4KnaB1BjqxJuwCSH-zq2A6W4I8Acddf7Fdw	com.gethype	2023-04-14 11:31:03.568+00	2023-04-14 11:31:03.568+00
\.


--
-- Data for Name: appleIds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."appleIds" (id, "firstName", "lastName", email, "createdAt", "updatedAt") FROM stdin;
000404.98b6d5aac0a54fc88feb029d05ea2a06.0646	xcode	themes	xcodethemes.test438@gmail.com	2023-03-30 05:28:07.203+00	2023-03-30 05:28:07.203+00
001837.dc9f424ad1ac4d5aa58b15ca43d31a25.1222	Weldon	Forney	by6cb2ct6z@privaterelay.appleid.com	2023-04-05 12:22:46.341+00	2023-04-05 12:22:46.341+00
000224.ca162df9c94b4598a9f5f930ba677d2a.1255	Bradly	Shoffner	tsc8sngj9w@privaterelay.appleid.com	2023-08-10 12:55:41.131+00	2023-08-10 12:55:41.131+00
000897.287795ced0e54bb99af8cff86276654a.2255	Apple	John	tqbmvgqdgr@privaterelay.appleid.com	2023-08-10 22:55:17.118+00	2023-08-10 22:55:17.118+00
000999.6a13890208dd4820b5b407aa0710d670.1636	Apple	John	g67nwcjfvf@privaterelay.appleid.com	2023-08-15 16:36:25.894+00	2023-08-15 16:36:25.894+00
000007.6ee9500ef2934fbbb057472814be34de.2344	Apple	John	2kfdfrjwwh@privaterelay.appleid.com	2023-09-05 23:44:24.158+00	2023-09-05 23:44:24.158+00
000564.41497a64650c41539647121b0ebaa8f6.2314	Tinley	Fugate	tinleybug319@icloud.com	2023-09-07 23:14:44.728+00	2023-09-07 23:14:44.728+00
000254.0e229887c0a3489f9c6fddbc57995d6e.2347	Braden	Ewing	nvgx8f2tr8@privaterelay.appleid.com	2023-09-07 23:47:46.058+00	2023-09-07 23:47:46.058+00
001826.3b440c93f5f54e8ab728c32d91856a58.2112	Brittany	Sharp	brittanymsharp30@gmail.com	2023-09-13 15:06:35.705+00	2023-09-13 15:06:35.705+00
001216.5714d5f612ef498592ad2c991e7d102c.0136	Melissa	Dye	melissadyern@aol.com	2023-09-14 01:36:23.264+00	2023-09-14 14:43:26.778+00
000409.5af2aa2d9d2d4516bb4b3de7f2bdf884.1521	Marjorie	Mullenix	j2bx6tzxmh@privaterelay.appleid.com	2023-09-18 15:21:25.449+00	2023-09-18 15:21:25.449+00
000042.ac1563dc374242ce95f6bca914b5ded1.1844	Apple	John	pk2f2mn287@privaterelay.appleid.com	2023-09-25 18:44:07.647+00	2023-09-25 18:44:07.647+00
001180.4da69c3c59364ca393f067f05ee8de24.0251	Jaelyn	Dye	hssdfdsrdy@privaterelay.appleid.com	2023-09-30 02:51:28.173+00	2023-09-30 02:51:28.173+00
000209.ded46be8befe4b4782029e42a7f9ed54.0416	Ronald	Davenport	nyt9jff5zz@privaterelay.appleid.com	2023-10-04 04:16:56.665+00	2023-10-04 04:16:56.665+00
001488.482a2599c61b40e0aeacb0df9b717a6d.1158	Martha	Henry	4rc5thnn8t@privaterelay.appleid.com	2023-10-16 11:58:09.821+00	2023-10-16 11:58:09.821+00
001654.ee86cf451be54541ae516bd789f6f281.1349	James	Shunk	kxftk2shzj@privaterelay.appleid.com	2023-10-19 13:49:27.637+00	2023-10-19 13:49:27.637+00
000565.9a944199c54b4f67824dd702b33ec6e0.0236	Clarence	Pinc	tdwj4chm4q@privaterelay.appleid.com	2023-10-22 02:36:18.774+00	2023-10-22 02:36:18.774+00
001607.95419730e8234dd89f51890449a9e817.0320	Mary	Damelio	csw5bb9wt9@privaterelay.appleid.com	2023-10-22 03:20:25.742+00	2023-10-22 03:20:25.742+00
001604.278ccae5253a4b9ca702d22b472012cb.1155	Apple	John	bkx84rbjzh@privaterelay.appleid.com	2023-10-27 11:55:14.223+00	2023-10-27 11:55:14.223+00
000648.b8d3de162b31478fa9592ec84c8a483a.2319	Virginia	Hill	f7w5zvzp4q@privaterelay.appleid.com	2023-10-30 23:19:20.677+00	2023-10-30 23:19:20.677+00
000129.128527bc57f14f2cb6ea52bc22c2ac3b.0912	Carmen	Koster	m2ywgm79gt@privaterelay.appleid.com	2023-11-05 09:12:33.287+00	2023-11-05 09:12:33.287+00
001784.22b5300b115e4607b28e1e0ffbe8fda3.0002	Donna	Moore	qbsb8jprr4@privaterelay.appleid.com	2023-11-18 00:02:38.893+00	2023-11-18 00:02:38.893+00
001718.fe361d9c03b64651b7c2670c14879aa8.1145	Tracy	Carkhuff	86gmy4cxw9@privaterelay.appleid.com	2023-11-24 11:46:00.24+00	2023-11-24 11:46:00.24+00
002030.83ae1b9cd6094970924f41f09dd339a7.0710	Nancy	Mcelwaine	427vntzyn8@privaterelay.appleid.com	2023-11-29 07:10:19.899+00	2023-11-29 07:10:19.899+00
001156.ed26d17216ee453488c2207f2e9b5776.1052	Apple	John	cbm5xfnnb6@privaterelay.appleid.com	2023-11-29 10:52:04.79+00	2023-11-29 10:52:04.79+00
001407.a91530a7972d48e1b5fdd275370b885b.0842	Cathy	Brown	gcz8xqjfwb@privaterelay.appleid.com	2023-12-02 08:42:44.867+00	2023-12-02 08:42:44.867+00
000235.f3d30ac0aca7416f8fe29d12cb47278a.0235	Jennifer	Larve	p8nrmfym2d@privaterelay.appleid.com	2023-12-06 02:35:30.733+00	2023-12-06 02:35:30.733+00
000438.836a14c2168142c2bc9368517b633151.1722	Jonathan	Walters	mzdbkgdtqy@privaterelay.appleid.com	2023-12-14 17:22:47.795+00	2023-12-14 17:22:47.795+00
000425.297b3adc1ba74bf4b62ffa5ca795b295.1131	Marie	Garcia	jqfzpg8s74@privaterelay.appleid.com	2023-12-23 11:31:09.693+00	2023-12-23 11:31:09.693+00
001148.7880bebc2cc244d8bb157de96813485d.0057	Randy	Murphy	jrmkm2@gmail.com	2024-01-24 00:57:39.14+00	2024-01-24 00:57:39.14+00
000735.3a6d3ae4bbb5442bb41698f4afa69e05.1418	Walter	Beyer	y8wzjy74gd@privaterelay.appleid.com	2024-03-11 14:18:09.493+00	2024-03-11 14:18:09.493+00
\.


--
-- Data for Name: appleTransactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."appleTransactions" (id, "transactionId", "originalTransactionId", "webOrderLineItemId", "bundleId", "productId", "subscriptionGroupIdentifier", "purchaseDate", "originalPurchaseDate", "expiresDate", quantity, type, "appAccountToken", "inAppOwnershipType", "signedDate", "autoRenewProductId", "autoRenewStatus", "recentSubscriptionStartDate", "notificationType", subtype, "notificationUUID", "bundleVersion", "createdAt", "updatedAt") FROM stdin;
2	2000000304289662	2000000304287264	2000000024097180	com.gethype	get_hype.monthly	21295449	2023-03-29 11:03:10+00	2023-03-29 10:58:17+00	2023-03-29 11:08:10+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:02:52.632+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	\N	00d24289-b60a-4cc5-a6eb-923c83940bfd	2	2023-03-29 11:02:53.271+00	2023-03-29 11:02:53.271+00
3	2000000304294850	2000000304287264	2000000024097536	com.gethype	get_hype.monthly	21295449	2023-03-29 11:08:10+00	2023-03-29 10:58:17+00	2023-03-29 11:13:10+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:07:35.976+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	\N	0857a88b-7735-445f-8220-b8f4d5dbc05d	2	2023-03-29 11:07:37.19+00	2023-03-29 11:07:37.19+00
4	2000000304297927	2000000304287264	2000000024098063	com.gethype	get_hype.monthly	21295449	2023-03-29 11:13:10+00	2023-03-29 10:58:17+00	2023-03-29 11:18:10+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:12:38.913+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	\N	7465f187-1b3a-45ee-8dca-943290e43d5a	2	2023-03-29 11:12:40.523+00	2023-03-29 11:12:40.523+00
5	2000000304301937	2000000304287264	2000000024098478	com.gethype	get_hype.monthly	21295449	2023-03-29 11:18:10+00	2023-03-29 10:58:17+00	2023-03-29 11:23:10+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:17:57.375+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	\N	769ac5a3-a588-4834-90c7-e8531fb32d3f	2	2023-03-29 11:17:57.99+00	2023-03-29 11:17:57.99+00
6	2000000304304983	2000000304287264	2000000024098977	com.gethype	get_hype.monthly	21295449	2023-03-29 11:23:10+00	2023-03-29 10:58:17+00	2023-03-29 11:28:10+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:22:33.415+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	\N	c2eb8324-958a-426b-9c43-7967b52d8a75	2	2023-03-29 11:22:34.525+00	2023-03-29 11:22:34.525+00
7	2000000304309158	2000000304287264	2000000024099373	com.gethype	get_hype.monthly	21295449	2023-03-29 11:28:27+00	2023-03-29 10:58:17+00	2023-03-29 11:33:27+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:28:49.628+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	\N	486adb03-245c-41af-8694-c64e020c36b5	2	2023-03-29 11:28:50.393+00	2023-03-29 11:28:50.393+00
8	2000000304309158	2000000304287264	2000000024099373	com.gethype	get_hype.monthly	21295449	2023-03-29 11:28:27+00	2023-03-29 10:58:17+00	2023-03-29 11:33:27+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:28:49.52+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	BILLING_RECOVERY	b7a33567-ea05-4da4-acc0-0302d852a3f7	2	2023-03-29 11:28:50.577+00	2023-03-29 11:28:50.577+00
9	2000000304312413	2000000304287264	2000000024099901	com.gethype	get_hype.monthly	21295449	2023-03-29 11:33:27+00	2023-03-29 10:58:17+00	2023-03-29 11:38:27+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:33:23.965+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	\N	798221bf-c2b1-4150-a057-c84a30bf5948	2	2023-03-29 11:33:24.89+00	2023-03-29 11:33:24.89+00
10	2000000304316736	2000000304287264	2000000024100333	com.gethype	get_hype.monthly	21295449	2023-03-29 11:38:27+00	2023-03-29 10:58:17+00	2023-03-29 11:43:27+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:38:02.861+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	\N	ccd60c65-8c1c-43c9-b667-2bee8cd3898f	2	2023-03-29 11:38:03.846+00	2023-03-29 11:38:03.846+00
11	2000000304322076	2000000304287264	2000000024100757	com.gethype	get_hype.monthly	21295449	2023-03-29 11:43:42+00	2023-03-29 10:58:17+00	2023-03-29 11:48:42+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:44:06.087+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	BILLING_RECOVERY	6fabb1df-d0ab-4a20-9aff-ff0cc471e12d	2	2023-03-29 11:44:07.359+00	2023-03-29 11:44:07.359+00
12	2000000304322076	2000000304287264	2000000024100757	com.gethype	get_hype.monthly	21295449	2023-03-29 11:43:42+00	2023-03-29 10:58:17+00	2023-03-29 11:48:42+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:44:05.976+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	\N	4d8221c6-cf90-4dfb-a8b9-2d93b54d62dd	2	2023-03-29 11:44:07.433+00	2023-03-29 11:44:07.433+00
13	2000000304325254	2000000304287264	2000000024101302	com.gethype	get_hype.monthly	21295449	2023-03-29 11:48:42+00	2023-03-29 10:58:17+00	2023-03-29 11:53:42+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:48:13.812+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	\N	88b1faa8-461d-4089-b32b-cf11ebed0e72	2	2023-03-29 11:48:14.681+00	2023-03-29 11:48:14.681+00
14	2000000304329724	2000000304287264	2000000024101631	com.gethype	get_hype.monthly	21295449	2023-03-29 11:54:10+00	2023-03-29 10:58:17+00	2023-03-29 11:59:10+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:55:21.513+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	\N	cb8a662d-6d1f-477a-ade0-349d84bd14bc	2	2023-03-29 11:55:22.192+00	2023-03-29 11:55:22.192+00
15	2000000304329724	2000000304287264	2000000024101631	com.gethype	get_hype.monthly	21295449	2023-03-29 11:54:10+00	2023-03-29 10:58:17+00	2023-03-29 11:59:10+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:55:21.413+00	get_hype.monthly	1	2023-03-29 10:58:10+00	DID_RENEW	BILLING_RECOVERY	336532cb-d733-4370-9876-56220c5feba6	2	2023-03-29 11:55:22.806+00	2023-03-29 11:55:22.806+00
16	2000000304329724	2000000304287264	2000000024101631	com.gethype	get_hype.monthly	21295449	2023-03-29 11:54:10+00	2023-03-29 10:58:17+00	2023-03-29 11:59:10+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 11:59:25.285+00	get_hype.monthly	0	2023-03-29 10:58:10+00	EXPIRED	VOLUNTARY	f7bb958f-1435-492d-9b50-4c0a9e667f27	2	2023-03-29 11:59:26.355+00	2023-03-29 11:59:26.355+00
17	2000000304711961	2000000304711961	2000000024158197	com.gethype	get_hype.monthly	21295449	2023-03-30 04:43:07+00	2023-03-30 04:43:13+00	2023-03-30 04:48:07+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 04:43:20.636+00	get_hype.monthly	1	2023-03-30 04:43:07+00	SUBSCRIBED	INITIAL_BUY	8ffcec30-6fa7-4e33-ad70-db22fe0cc833	2	2023-03-30 04:43:21.594+00	2023-03-30 04:43:21.594+00
18	2000000304712721	2000000304711961	2000000024158198	com.gethype	get_hype.monthly	21295449	2023-03-30 04:48:07+00	2023-03-30 04:43:13+00	2023-03-30 04:53:07+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 04:47:24.651+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	\N	809979f0-13ad-4566-9009-41e4f9fdaa47	2	2023-03-30 04:47:26.065+00	2023-03-30 04:47:26.065+00
19	2000000304714114	2000000304711961	2000000024158361	com.gethype	get_hype.monthly	21295449	2023-03-30 04:53:07+00	2023-03-30 04:43:13+00	2023-03-30 04:58:07+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 04:52:28.663+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	\N	2cce29df-0ceb-4c1f-a29c-40a6f427103a	2	2023-03-30 04:52:29.609+00	2023-03-30 04:52:29.609+00
20	2000000304715839	2000000304711961	2000000024158584	com.gethype	get_hype.monthly	21295449	2023-03-30 04:58:07+00	2023-03-30 04:43:13+00	2023-03-30 05:03:07+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 04:57:33.334+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	\N	4578bc33-e135-4801-a267-b44347796b66	2	2023-03-30 04:57:34.314+00	2023-03-30 04:57:34.314+00
21	2000000304717203	2000000304711961	2000000024158805	com.gethype	get_hype.monthly	21295449	2023-03-30 05:03:07+00	2023-03-30 04:43:13+00	2023-03-30 05:08:07+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 05:02:34.376+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	\N	4fc914a4-d738-485f-9172-3a43713c7712	2	2023-03-30 05:02:35.28+00	2023-03-30 05:02:35.28+00
22	2000000304718407	2000000304711961	2000000024159025	com.gethype	get_hype.monthly	21295449	2023-03-30 05:08:07+00	2023-03-30 04:43:13+00	2023-03-30 05:13:07+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 05:07:27.386+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	\N	9762a75c-4676-4a03-b430-a6a5f25d5c42	2	2023-03-30 05:07:28.647+00	2023-03-30 05:07:28.647+00
23	2000000304720729	2000000304711961	2000000024159250	com.gethype	get_hype.monthly	21295449	2023-03-30 05:13:07+00	2023-03-30 04:43:13+00	2023-03-30 05:18:07+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 05:12:32.486+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	\N	0f0a071f-2352-4dd5-8894-2c518fb709d1	2	2023-03-30 05:12:33.739+00	2023-03-30 05:12:33.739+00
24	2000000304722129	2000000304711961	2000000024159501	com.gethype	get_hype.monthly	21295449	2023-03-30 05:18:07+00	2023-03-30 04:43:13+00	2023-03-30 05:23:07+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 05:17:26.25+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	\N	c998ff4f-8f69-42de-b89f-f7dee1167298	2	2023-03-30 05:17:27.516+00	2023-03-30 05:17:27.516+00
25	2000000304723828	2000000304711961	2000000024159729	com.gethype	get_hype.monthly	21295449	2023-03-30 05:23:07+00	2023-03-30 04:43:13+00	2023-03-30 05:28:07+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 05:22:19.12+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	\N	450cd10a-16eb-4da4-99eb-c7f5c0878a45	2	2023-03-30 05:22:20.509+00	2023-03-30 05:22:20.509+00
26	2000000304725465	2000000304711961	2000000024159946	com.gethype	get_hype.monthly	21295449	2023-03-30 05:28:07+00	2023-03-30 04:43:13+00	2023-03-30 05:33:07+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 05:27:23.751+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	\N	ea9f02a7-21ca-4db0-86e1-8074500c3a7c	2	2023-03-30 05:27:25.192+00	2023-03-30 05:27:25.192+00
27	2000000304727600	2000000304711961	2000000024160179	com.gethype	get_hype.monthly	21295449	2023-03-30 05:33:13+00	2023-03-30 04:43:13+00	2023-03-30 05:38:13+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 05:33:34.747+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	\N	07c4f105-6e9b-417b-bcc6-2b33f429c20f	2	2023-03-30 05:33:35.953+00	2023-03-30 05:33:35.953+00
28	2000000304727600	2000000304711961	2000000024160179	com.gethype	get_hype.monthly	21295449	2023-03-30 05:33:13+00	2023-03-30 04:43:13+00	2023-03-30 05:38:13+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 05:33:34.847+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	BILLING_RECOVERY	c3c9231f-af4d-42ca-a8b4-61e6ba55ba62	2	2023-03-30 05:33:36.743+00	2023-03-30 05:33:36.743+00
29	2000000304730923	2000000304711961	2000000024160459	com.gethype	get_hype.monthly	21295449	2023-03-30 05:38:43+00	2023-03-30 04:43:13+00	2023-03-30 05:43:43+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 05:39:08.063+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	BILLING_RECOVERY	277cbd1d-47a5-4018-903a-09e0beecb11d	2	2023-03-30 05:39:08.908+00	2023-03-30 05:39:08.908+00
30	2000000304730923	2000000304711961	2000000024160459	com.gethype	get_hype.monthly	21295449	2023-03-30 05:38:43+00	2023-03-30 04:43:13+00	2023-03-30 05:43:43+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 05:39:07.957+00	get_hype.monthly	1	2023-03-30 04:43:07+00	DID_RENEW	\N	caa1c46f-b99c-4ca1-ba57-4dfc9bb02e4b	2	2023-03-30 05:39:09.029+00	2023-03-30 05:39:09.029+00
31	2000000304730923	2000000304711961	2000000024160459	com.gethype	get_hype.monthly	21295449	2023-03-30 05:38:43+00	2023-03-30 04:43:13+00	2023-03-30 05:43:43+00	1	Auto-Renewable Subscription	c263d49b-1ced-4f29-b215-da96d141bc6b	PURCHASED	2023-03-30 05:45:10.423+00	get_hype.monthly	0	2023-03-30 04:43:07+00	EXPIRED	VOLUNTARY	b7bc1a46-77a3-4c5e-909a-564db1f58895	2	2023-03-30 05:45:11.938+00	2023-03-30 05:45:11.938+00
32	2000000307099178	2000000304711961	2000000024172970	com.gethype	get_hype.monthly	21295449	2023-04-04 04:20:06+00	2023-03-30 04:43:13+00	2023-04-04 04:25:06+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 04:20:20.68+00	get_hype.monthly	1	2023-04-04 04:20:06+00	SUBSCRIBED	RESUBSCRIBE	92ebcdf4-ccf7-4451-afb9-1fd0f498547d	2	2023-04-04 04:20:21.414+00	2023-04-04 04:20:21.414+00
33	2000000307100750	2000000304711961	2000000024483940	com.gethype	get_hype.monthly	21295449	2023-04-04 04:25:06+00	2023-03-30 04:43:13+00	2023-04-04 04:30:06+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 04:24:59.961+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	\N	e3bdb44f-273a-43fb-9c53-b777eb7a9a28	2	2023-04-04 04:25:00.698+00	2023-04-04 04:25:00.698+00
34	2000000307102201	2000000304711961	2000000024484121	com.gethype	get_hype.monthly	21295449	2023-04-04 04:30:06+00	2023-03-30 04:43:13+00	2023-04-04 04:35:06+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 04:30:13.45+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	\N	a35edf6c-db4a-443a-b8fe-c386908bcab2	2	2023-04-04 04:30:14.284+00	2023-04-04 04:30:14.284+00
35	2000000307104194	2000000304711961	2000000024484315	com.gethype	get_hype.monthly	21295449	2023-04-04 04:35:06+00	2023-03-30 04:43:13+00	2023-04-04 04:40:06+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 04:35:00.271+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	\N	533a8395-599d-4b0a-b304-29069238b9b7	2	2023-04-04 04:35:01.24+00	2023-04-04 04:35:01.24+00
36	2000000307106017	2000000304711961	2000000024484513	com.gethype	get_hype.monthly	21295449	2023-04-04 04:40:06+00	2023-03-30 04:43:13+00	2023-04-04 04:45:06+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 04:39:25.404+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	\N	e8336c73-87d5-486b-a0f0-7fe5b55ef614	2	2023-04-04 04:39:26.441+00	2023-04-04 04:39:26.441+00
37	2000000307108682	2000000304711961	2000000024484700	com.gethype	get_hype.monthly	21295449	2023-04-04 04:45:25+00	2023-03-30 04:43:13+00	2023-04-04 04:50:25+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 04:45:42.719+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	BILLING_RECOVERY	4879c0ac-1bc2-4493-b75c-3679d8547086	2	2023-04-04 04:45:43.766+00	2023-04-04 04:45:43.766+00
38	2000000307108682	2000000304711961	2000000024484700	com.gethype	get_hype.monthly	21295449	2023-04-04 04:45:25+00	2023-03-30 04:43:13+00	2023-04-04 04:50:25+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 04:45:42.838+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	\N	1e27a327-4744-45f9-a662-4ccdf72bc017	2	2023-04-04 04:45:43.886+00	2023-04-04 04:45:43.886+00
39	2000000307110159	2000000304711961	2000000024484919	com.gethype	get_hype.monthly	21295449	2023-04-04 04:50:25+00	2023-03-30 04:43:13+00	2023-04-04 04:55:25+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 04:50:17.216+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	\N	18a3fe1c-7c40-4438-8aa9-9324bb5d4991	2	2023-04-04 04:50:18.397+00	2023-04-04 04:50:18.397+00
40	2000000307113038	2000000304711961	2000000024485110	com.gethype	get_hype.monthly	21295449	2023-04-04 04:56:04+00	2023-03-30 04:43:13+00	2023-04-04 05:01:04+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 04:56:18.695+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	\N	bb4497e0-714b-4693-8007-efdd1ed26a3b	2	2023-04-04 04:56:19.366+00	2023-04-04 04:56:19.366+00
41	2000000307113038	2000000304711961	2000000024485110	com.gethype	get_hype.monthly	21295449	2023-04-04 04:56:04+00	2023-03-30 04:43:13+00	2023-04-04 05:01:04+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 04:56:20.61+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	BILLING_RECOVERY	a384d4da-310a-4fa2-9626-90d4a65ced72	2	2023-04-04 04:56:21.155+00	2023-04-04 04:56:21.155+00
42	2000000307116717	2000000304711961	2000000024485347	com.gethype	get_hype.monthly	21295449	2023-04-04 05:01:04+00	2023-03-30 04:43:13+00	2023-04-04 05:06:04+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 05:00:47.385+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	\N	8e403e83-9fca-40be-8706-04c19f15ed18	2	2023-04-04 05:00:48.353+00	2023-04-04 05:00:48.353+00
43	2000000307118341	2000000304711961	2000000024485532	com.gethype	get_hype.monthly	21295449	2023-04-04 05:06:04+00	2023-03-30 04:43:13+00	2023-04-04 05:11:04+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 05:05:42.852+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	\N	0d21f37e-4c62-4f64-8a1b-8177b76d7bd2	2	2023-04-04 05:05:44.11+00	2023-04-04 05:05:44.11+00
44	2000000307120368	2000000304711961	2000000024485733	com.gethype	get_hype.monthly	21295449	2023-04-04 05:11:04+00	2023-03-30 04:43:13+00	2023-04-04 05:16:04+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 05:11:19.243+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	\N	67fa9464-abc5-4c8f-8be0-08e582de519f	2	2023-04-04 05:11:20.291+00	2023-04-04 05:11:20.291+00
45	2000000307123552	2000000304711961	2000000024485958	com.gethype	get_hype.monthly	21295449	2023-04-04 05:18:43+00	2023-03-30 04:43:13+00	2023-04-04 05:23:43+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 05:18:57.815+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	\N	862dfeaf-180c-4ff6-b81c-2f342ae81429	2	2023-04-04 05:18:58.563+00	2023-04-04 05:18:58.563+00
46	2000000307123552	2000000304711961	2000000024485958	com.gethype	get_hype.monthly	21295449	2023-04-04 05:18:43+00	2023-03-30 04:43:13+00	2023-04-04 05:23:43+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 05:18:57.724+00	get_hype.monthly	1	2023-04-04 04:20:06+00	DID_RENEW	BILLING_RECOVERY	0b07248d-9894-4cba-9805-77b8ffde1847	2	2023-04-04 05:18:58.785+00	2023-04-04 05:18:58.785+00
47	2000000307123552	2000000304711961	2000000024485958	com.gethype	get_hype.monthly	21295449	2023-04-04 05:18:43+00	2023-03-30 04:43:13+00	2023-04-04 05:23:43+00	1	Auto-Renewable Subscription	456b9492-371f-4b46-b627-92d50651e53b	PURCHASED	2023-04-04 05:23:45.121+00	get_hype.monthly	0	2023-04-04 04:20:06+00	EXPIRED	VOLUNTARY	2eaf9aa7-f47b-487c-a97f-1d898a1a8a18	2	2023-04-04 05:23:46.082+00	2023-04-04 05:23:46.082+00
48	2000000307836596	2000000304287264	2000000024102244	com.gethype	get_hype.monthly	21295449	2023-04-05 06:25:36+00	2023-03-29 10:58:17+00	2023-04-05 06:30:36+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 06:26:04.901+00	get_hype.monthly	1	2023-04-05 06:25:36+00	SUBSCRIBED	RESUBSCRIBE	73a540d7-0abb-424c-9c44-13261362b8cd	2	2023-04-05 06:26:06.09+00	2023-04-05 06:26:06.09+00
49	2000000307838837	2000000304287264	2000000024576405	com.gethype	get_hype.monthly	21295449	2023-04-05 06:31:31+00	2023-03-29 10:58:17+00	2023-04-05 06:36:31+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 06:31:48.685+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	BILLING_RECOVERY	1a51ee43-a967-405d-86c9-ffe16e7c1481	2	2023-04-05 06:31:49.643+00	2023-04-05 06:31:49.643+00
50	2000000307838837	2000000304287264	2000000024576405	com.gethype	get_hype.monthly	21295449	2023-04-05 06:31:31+00	2023-03-29 10:58:17+00	2023-04-05 06:36:31+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 06:31:48.84+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	\N	9b4c33af-4b58-4dba-8b31-fdfb7e53162e	2	2023-04-05 06:31:49.99+00	2023-04-05 06:31:49.99+00
51	2000000307841435	2000000304287264	2000000024576696	com.gethype	get_hype.monthly	21295449	2023-04-05 06:36:31+00	2023-03-29 10:58:17+00	2023-04-05 06:41:31+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 06:36:36.716+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	\N	63fd4ee8-401a-4316-ae3a-1a0aa2694325	2	2023-04-05 06:36:38.08+00	2023-04-05 06:36:38.08+00
52	2000000307845234	2000000304287264	2000000024576942	com.gethype	get_hype.monthly	21295449	2023-04-05 06:42:51+00	2023-03-29 10:58:17+00	2023-04-05 06:47:51+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 06:43:06.733+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	\N	773bc40a-89ff-496d-9ad3-da71c14a37f7	2	2023-04-05 06:43:07.268+00	2023-04-05 06:43:07.268+00
53	2000000307845234	2000000304287264	2000000024576942	com.gethype	get_hype.monthly	21295449	2023-04-05 06:42:51+00	2023-03-29 10:58:17+00	2023-04-05 06:47:51+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 06:43:06.891+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	BILLING_RECOVERY	91374cc9-279a-4216-9ab2-41fa8a002ed0	2	2023-04-05 06:43:08.062+00	2023-04-05 06:43:08.062+00
54	2000000307847515	2000000304287264	2000000024577333	com.gethype	get_hype.monthly	21295449	2023-04-05 06:47:51+00	2023-03-29 10:58:17+00	2023-04-05 06:52:51+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 06:47:11.019+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	\N	24afe052-1425-4082-92ee-4a32e59eec95	2	2023-04-05 06:47:11.631+00	2023-04-05 06:47:11.631+00
55	2000000307850107	2000000304287264	2000000024577550	com.gethype	get_hype.monthly	21295449	2023-04-05 06:52:51+00	2023-03-29 10:58:17+00	2023-04-05 06:57:51+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 06:52:52.392+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	\N	0c11e15b-911b-4ff3-9559-87f941e56622	2	2023-04-05 06:52:53.139+00	2023-04-05 06:52:53.139+00
56	2000000307853897	2000000304287264	2000000024577868	com.gethype	get_hype.monthly	21295449	2023-04-05 06:57:51+00	2023-03-29 10:58:17+00	2023-04-05 07:02:51+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 06:58:01.949+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	\N	3b8657c2-156a-44b1-87d9-5e1f93672204	2	2023-04-05 06:58:02.497+00	2023-04-05 06:58:02.497+00
57	2000000307856556	2000000304287264	2000000024578164	com.gethype	get_hype.monthly	21295449	2023-04-05 07:02:51+00	2023-03-29 10:58:17+00	2023-04-05 07:07:51+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 07:02:27.064+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	\N	47d9f714-d91c-4967-bb3e-9ff40fe0d88e	2	2023-04-05 07:02:28.437+00	2023-04-05 07:02:28.437+00
58	2000000307859598	2000000304287264	2000000024578432	com.gethype	get_hype.monthly	21295449	2023-04-05 07:07:51+00	2023-03-29 10:58:17+00	2023-04-05 07:12:51+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 07:07:44.213+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	\N	7484ed1d-0eea-4b0b-94ae-c9cca810fa4b	2	2023-04-05 07:07:44.685+00	2023-04-05 07:07:44.685+00
59	2000000307862803	2000000304287264	2000000024578754	com.gethype	get_hype.monthly	21295449	2023-04-05 07:12:51+00	2023-03-29 10:58:17+00	2023-04-05 07:17:51+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 07:13:01.507+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	\N	e4bc941b-9528-44f7-a33d-ba76dc18569e	2	2023-04-05 07:13:02.589+00	2023-04-05 07:13:02.589+00
60	2000000307866246	2000000304287264	2000000024579048	com.gethype	get_hype.monthly	21295449	2023-04-05 07:17:53+00	2023-03-29 10:58:17+00	2023-04-05 07:22:53+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 07:18:10.476+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	BILLING_RECOVERY	871aba5e-07e0-49ff-92fe-13bc52a8ba35	2	2023-04-05 07:18:11.244+00	2023-04-05 07:18:11.244+00
61	2000000307866246	2000000304287264	2000000024579048	com.gethype	get_hype.monthly	21295449	2023-04-05 07:17:53+00	2023-03-29 10:58:17+00	2023-04-05 07:22:53+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 07:18:10.396+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	\N	dad0d40a-100b-48c0-8fa5-7290ee40cb4d	2	2023-04-05 07:18:11.307+00	2023-04-05 07:18:11.307+00
62	2000000307870247	2000000304287264	2000000024579391	com.gethype	get_hype.monthly	21295449	2023-04-05 07:22:53+00	2023-03-29 10:58:17+00	2023-04-05 07:27:53+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 07:23:03.309+00	get_hype.monthly	1	2023-04-05 06:25:36+00	DID_RENEW	\N	49519cde-5d85-4637-af30-137df8f5b668	2	2023-04-05 07:23:04.307+00	2023-04-05 07:23:04.307+00
63	2000000307870247	2000000304287264	2000000024579391	com.gethype	get_hype.monthly	21295449	2023-04-05 07:22:53+00	2023-03-29 10:58:17+00	2023-04-05 07:27:53+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 07:27:55.573+00	get_hype.monthly	0	2023-04-05 06:25:36+00	EXPIRED	VOLUNTARY	7a477c9c-254e-491b-91f0-1cb13ed75a84	2	2023-04-05 07:27:56.66+00	2023-04-05 07:27:56.66+00
64	2000000307972721	2000000304287264	2000000024579733	com.gethype	get_hype.monthly	21295449	2023-04-05 09:36:42+00	2023-03-29 10:58:17+00	2023-04-05 09:41:42+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 09:36:53.933+00	get_hype.monthly	1	2023-04-05 09:36:42+00	SUBSCRIBED	RESUBSCRIBE	66f78a9d-69e4-4444-aaa3-e393bf8b2445	2	2023-04-05 09:36:54.949+00	2023-04-05 09:36:54.949+00
65	2000000307980135	2000000304287264	2000000024590289	com.gethype	get_hype.monthly	21295449	2023-04-05 09:43:29+00	2023-03-29 10:58:17+00	2023-04-05 09:48:29+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 09:43:42.785+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	\N	4431692b-661a-49f8-8900-244bc5b7145b	2	2023-04-05 09:43:43.452+00	2023-04-05 09:43:43.452+00
66	2000000307980135	2000000304287264	2000000024590289	com.gethype	get_hype.monthly	21295449	2023-04-05 09:43:29+00	2023-03-29 10:58:17+00	2023-04-05 09:48:29+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 09:43:42.878+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	BILLING_RECOVERY	df37a7bc-0823-4504-a563-169c72b439a9	2	2023-04-05 09:43:44.063+00	2023-04-05 09:43:44.063+00
67	2000000307984866	2000000304287264	2000000024590873	com.gethype	get_hype.monthly	21295449	2023-04-05 09:48:54+00	2023-03-29 10:58:17+00	2023-04-05 09:53:54+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 09:49:10.34+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	\N	3d954505-41f8-4f6d-b02f-54734149cc29	2	2023-04-05 09:49:11.468+00	2023-04-05 09:49:11.468+00
68	2000000307984866	2000000304287264	2000000024590873	com.gethype	get_hype.monthly	21295449	2023-04-05 09:48:54+00	2023-03-29 10:58:17+00	2023-04-05 09:53:54+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 09:49:10.239+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	BILLING_RECOVERY	ec0e410e-6fd1-4cae-a9aa-9328ea91f07c	2	2023-04-05 09:49:11.501+00	2023-04-05 09:49:11.501+00
69	2000000307989141	2000000304287264	2000000024591313	com.gethype	get_hype.monthly	21295449	2023-04-05 09:53:54+00	2023-03-29 10:58:17+00	2023-04-05 09:58:54+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 09:54:08.119+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	\N	9f7eb6f5-e81d-48d3-9406-065e5c14664f	2	2023-04-05 09:54:09.203+00	2023-04-05 09:54:09.203+00
70	2000000307994104	2000000304287264	2000000024591703	com.gethype	get_hype.monthly	21295449	2023-04-05 09:58:54+00	2023-03-29 10:58:17+00	2023-04-05 10:03:54+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 09:58:46.569+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	\N	e4a96392-5d68-468e-a63c-a5ad7614dbb2	2	2023-04-05 09:58:47.445+00	2023-04-05 09:58:47.445+00
71	2000000307999305	2000000304287264	2000000024592146	com.gethype	get_hype.monthly	21295449	2023-04-05 10:03:54+00	2023-03-29 10:58:17+00	2023-04-05 10:08:54+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 10:03:28.217+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	\N	1a993c06-7963-400e-893b-b29f0036e0b4	2	2023-04-05 10:03:29.241+00	2023-04-05 10:03:29.241+00
72	2000000308004066	2000000304287264	2000000024592541	com.gethype	get_hype.monthly	21295449	2023-04-05 10:08:56+00	2023-03-29 10:58:17+00	2023-04-05 10:13:56+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 10:09:57.562+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	\N	51fc1e07-814f-46bc-8f4e-7c577858ebb6	2	2023-04-05 10:09:58.73+00	2023-04-05 10:09:58.73+00
73	2000000308004066	2000000304287264	2000000024592541	com.gethype	get_hype.monthly	21295449	2023-04-05 10:08:56+00	2023-03-29 10:58:17+00	2023-04-05 10:13:56+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 10:09:57.677+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	BILLING_RECOVERY	5cbcc165-ab01-4420-9762-90305b92fabf	2	2023-04-05 10:09:59.229+00	2023-04-05 10:09:59.229+00
74	2000000308006864	2000000304287264	2000000024593027	com.gethype	get_hype.monthly	21295449	2023-04-05 10:13:56+00	2023-03-29 10:58:17+00	2023-04-05 10:18:56+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 10:13:15.713+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	\N	287b22a0-748a-4c45-9c95-5d188927a4e6	2	2023-04-05 10:13:16.238+00	2023-04-05 10:13:16.238+00
75	2000000308009632	2000000304287264	2000000024593382	com.gethype	get_hype.monthly	21295449	2023-04-05 10:18:56+00	2023-03-29 10:58:17+00	2023-04-05 10:23:56+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 10:19:02.436+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	\N	8b3b2423-a734-48c5-9152-5a327d6b214c	2	2023-04-05 10:19:03.219+00	2023-04-05 10:19:03.219+00
76	2000000308015135	2000000304287264	2000000024593847	com.gethype	get_hype.monthly	21295449	2023-04-05 10:23:56+00	2023-03-29 10:58:17+00	2023-04-05 10:28:56+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 10:23:25.735+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	\N	43a23d5e-e5c2-4605-8c11-c790c8f7eee6	2	2023-04-05 10:23:26.892+00	2023-04-05 10:23:26.892+00
77	2000000308017669	2000000304287264	2000000024594255	com.gethype	get_hype.monthly	21295449	2023-04-05 10:29:04+00	2023-03-29 10:58:17+00	2023-04-05 10:34:04+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 10:29:17.864+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	BILLING_RECOVERY	3cf5aa45-0f5b-43e3-8ce9-a90b54404d3e	2	2023-04-05 10:29:18.798+00	2023-04-05 10:29:18.798+00
78	2000000308017669	2000000304287264	2000000024594255	com.gethype	get_hype.monthly	21295449	2023-04-05 10:29:04+00	2023-03-29 10:58:17+00	2023-04-05 10:34:04+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 10:29:17.779+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	\N	7e80e7c7-d9f3-4fbc-a69a-f80dd745be23	2	2023-04-05 10:29:18.903+00	2023-04-05 10:29:18.903+00
79	2000000308021379	2000000304287264	2000000024594708	com.gethype	get_hype.monthly	21295449	2023-04-05 10:34:41+00	2023-03-29 10:58:17+00	2023-04-05 10:39:41+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 10:34:51.702+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	\N	abc2e5aa-8aac-4f77-9890-4196e6da4f6a	2	2023-04-05 10:34:52.164+00	2023-04-05 10:34:52.164+00
80	2000000308021379	2000000304287264	2000000024594708	com.gethype	get_hype.monthly	21295449	2023-04-05 10:34:41+00	2023-03-29 10:58:17+00	2023-04-05 10:39:41+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 10:34:51.821+00	get_hype.monthly	1	2023-04-05 09:36:42+00	DID_RENEW	BILLING_RECOVERY	7df314f6-2a36-49b4-ae84-4b795f2ecf80	2	2023-04-05 10:34:52.615+00	2023-04-05 10:34:52.615+00
81	2000000308021379	2000000304287264	2000000024594708	com.gethype	get_hype.monthly	21295449	2023-04-05 10:34:41+00	2023-03-29 10:58:17+00	2023-04-05 10:39:41+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-05 10:39:44.867+00	get_hype.monthly	0	2023-04-05 09:36:42+00	EXPIRED	VOLUNTARY	49e947d2-d77c-43bf-9eb1-c85ecddda36c	2	2023-04-05 10:39:46.36+00	2023-04-05 10:39:46.36+00
82	2000000309204246	2000000304711961	2000000024486315	com.gethype	get_hype.monthly	21295449	2023-04-07 06:24:36+00	2023-03-30 04:43:13+00	2023-04-07 06:29:36+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 06:25:23.234+00	get_hype.monthly	1	2023-04-07 06:24:36+00	SUBSCRIBED	RESUBSCRIBE	11f26d73-b4ff-418d-a92e-68b36684aa65	2	2023-04-07 06:25:24.392+00	2023-04-07 06:25:24.392+00
83	2000000309209794	2000000304711961	2000000024747637	com.gethype	get_hype.monthly	21295449	2023-04-07 06:31:00+00	2023-03-30 04:43:13+00	2023-04-07 06:36:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 06:31:14.762+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	\N	297ab36f-d0e4-43ae-80ec-03b249ab4099	2	2023-04-07 06:31:15.821+00	2023-04-07 06:31:15.821+00
84	2000000309209794	2000000304711961	2000000024747637	com.gethype	get_hype.monthly	21295449	2023-04-07 06:31:00+00	2023-03-30 04:43:13+00	2023-04-07 06:36:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 06:31:14.568+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	BILLING_RECOVERY	7fb9d0e5-105a-48b1-a5b2-b5c2dd262b31	2	2023-04-07 06:31:16.059+00	2023-04-07 06:31:16.059+00
85	2000000309212584	2000000304711961	2000000024748052	com.gethype	get_hype.monthly	21295449	2023-04-07 06:36:00+00	2023-03-30 04:43:13+00	2023-04-07 06:41:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 06:35:14.624+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	\N	88203dbf-ebd5-4c49-b2d4-7244e5b50dce	2	2023-04-07 06:35:15.4+00	2023-04-07 06:35:15.4+00
86	2000000309215664	2000000304711961	2000000024748320	com.gethype	get_hype.monthly	21295449	2023-04-07 06:41:00+00	2023-03-30 04:43:13+00	2023-04-07 06:46:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 06:40:26.047+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	\N	b3db4df0-f08d-4ea5-8a82-bca501976c16	2	2023-04-07 06:40:27.55+00	2023-04-07 06:40:27.55+00
87	2000000309219277	2000000304711961	2000000024748659	com.gethype	get_hype.monthly	21295449	2023-04-07 06:46:00+00	2023-03-30 04:43:13+00	2023-04-07 06:51:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 06:45:47.863+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	\N	8ff718f7-d87c-46fb-98e7-048d2d01d32b	2	2023-04-07 06:45:48.673+00	2023-04-07 06:45:48.673+00
88	2000000309222497	2000000304711961	2000000024749007	com.gethype	get_hype.monthly	21295449	2023-04-07 06:51:00+00	2023-03-30 04:43:13+00	2023-04-07 06:56:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 06:50:27.023+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	\N	8805b9a7-6830-4402-969c-8ff4cb9cb5c0	2	2023-04-07 06:50:27.673+00	2023-04-07 06:50:27.673+00
89	2000000309226766	2000000304711961	2000000024749343	com.gethype	get_hype.monthly	21295449	2023-04-07 06:56:00+00	2023-03-30 04:43:13+00	2023-04-07 07:01:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 06:55:16.293+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	\N	9a8b4d3f-9fe6-48a3-953d-f7052b85b998	2	2023-04-07 06:55:17.342+00	2023-04-07 06:55:17.342+00
90	2000000309230244	2000000304711961	2000000024749702	com.gethype	get_hype.monthly	21295449	2023-04-07 07:01:00+00	2023-03-30 04:43:13+00	2023-04-07 07:06:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 07:00:34.8+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	\N	fab09d7c-a05d-4633-82a2-8bd4a7db940f	2	2023-04-07 07:00:35.595+00	2023-04-07 07:00:35.595+00
91	2000000309235714	2000000304711961	2000000024750072	com.gethype	get_hype.monthly	21295449	2023-04-07 07:06:00+00	2023-03-30 04:43:13+00	2023-04-07 07:11:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 07:05:23.638+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	\N	14049ab5-82ab-406a-ac4a-1b970a8c2ac9	2	2023-04-07 07:05:25.01+00	2023-04-07 07:05:25.01+00
92	2000000309239446	2000000304711961	2000000024750421	com.gethype	get_hype.monthly	21295449	2023-04-07 07:11:00+00	2023-03-30 04:43:13+00	2023-04-07 07:16:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 07:10:48.903+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	\N	865f138f-f1b3-466c-b4ec-baed2f97da25	2	2023-04-07 07:10:50.039+00	2023-04-07 07:10:50.039+00
93	2000000309243891	2000000304711961	2000000024750838	com.gethype	get_hype.monthly	21295449	2023-04-07 07:16:00+00	2023-03-30 04:43:13+00	2023-04-07 07:21:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 07:15:55.707+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	\N	b64f2241-d4ef-4118-a628-339ffab9ede6	2	2023-04-07 07:15:56.861+00	2023-04-07 07:15:56.861+00
94	2000000309247247	2000000304711961	2000000024751224	com.gethype	get_hype.monthly	21295449	2023-04-07 07:21:00+00	2023-03-30 04:43:13+00	2023-04-07 07:26:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 07:20:42.411+00	get_hype.monthly	1	2023-04-07 06:24:36+00	DID_RENEW	\N	7f8c5ca5-7c41-4bd0-b8dc-b9b8ce4b0954	2	2023-04-07 07:20:43.187+00	2023-04-07 07:20:43.187+00
95	2000000309247247	2000000304711961	2000000024751224	com.gethype	get_hype.monthly	21295449	2023-04-07 07:21:00+00	2023-03-30 04:43:13+00	2023-04-07 07:26:00+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-07 07:26:35.302+00	get_hype.monthly	0	2023-04-07 06:24:36+00	EXPIRED	VOLUNTARY	7465647b-a493-4c23-8396-b92dda2c44af	2	2023-04-07 07:26:36.134+00	2023-04-07 07:26:36.134+00
96	2000000309443355	2000000304287264	2000000024595168	com.gethype	get_hype.monthly	21295449	2023-04-07 10:34:45+00	2023-03-29 10:58:17+00	2023-04-07 10:39:45+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 10:35:04.283+00	get_hype.monthly	1	2023-04-07 10:34:45+00	SUBSCRIBED	RESUBSCRIBE	7dbdc722-f717-44bb-9821-84140f15f729	2	2023-04-07 10:35:05.341+00	2023-04-07 10:35:05.341+00
97	2000000309448682	2000000304287264	2000000024767626	com.gethype	get_hype.monthly	21295449	2023-04-07 10:39:45+00	2023-03-29 10:58:17+00	2023-04-07 10:44:45+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 10:39:19.808+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	\N	29683550-247b-485c-bbfb-769bb5a810d9	2	2023-04-07 10:39:20.789+00	2023-04-07 10:39:20.789+00
98	2000000309453703	2000000304287264	2000000024767945	com.gethype	get_hype.monthly	21295449	2023-04-07 10:44:49+00	2023-03-29 10:58:17+00	2023-04-07 10:49:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 10:45:10.622+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	\N	49094a7d-c57d-407f-812a-c0fdf5805f71	2	2023-04-07 10:45:11.217+00	2023-04-07 10:45:11.217+00
99	2000000309453703	2000000304287264	2000000024767945	com.gethype	get_hype.monthly	21295449	2023-04-07 10:44:49+00	2023-03-29 10:58:17+00	2023-04-07 10:49:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 10:45:10.529+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	BILLING_RECOVERY	f5eb7a89-9f52-47e2-934c-526883187803	2	2023-04-07 10:45:11.335+00	2023-04-07 10:45:11.335+00
100	2000000309458306	2000000304287264	2000000024768562	com.gethype	get_hype.monthly	21295449	2023-04-07 10:49:49+00	2023-03-29 10:58:17+00	2023-04-07 10:54:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 10:49:38.723+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	\N	e7bc7981-2940-4e63-82de-d30ad30d8f9e	2	2023-04-07 10:49:39.426+00	2023-04-07 10:49:39.426+00
101	2000000309460528	2000000304287264	2000000024768965	com.gethype	get_hype.monthly	21295449	2023-04-07 10:54:49+00	2023-03-29 10:58:17+00	2023-04-07 10:59:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 10:54:06.038+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	\N	799a4dec-531a-4246-a710-231d9bf7e176	2	2023-04-07 10:54:07.434+00	2023-04-07 10:54:07.434+00
102	2000000309463935	2000000304287264	2000000024769347	com.gethype	get_hype.monthly	21295449	2023-04-07 10:59:49+00	2023-03-29 10:58:17+00	2023-04-07 11:04:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 10:59:02.44+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	\N	d44f2a1a-1101-43ac-9fee-0902ec7f1e4a	2	2023-04-07 10:59:04.122+00	2023-04-07 10:59:04.122+00
103	2000000309468444	2000000304287264	2000000024769818	com.gethype	get_hype.monthly	21295449	2023-04-07 11:04:49+00	2023-03-29 10:58:17+00	2023-04-07 11:09:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 11:04:14.4+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	\N	7422a7a7-d570-4bfb-aa10-15d8526c9afa	2	2023-04-07 11:04:15.879+00	2023-04-07 11:04:15.879+00
104	2000000309472181	2000000304287264	2000000024770269	com.gethype	get_hype.monthly	21295449	2023-04-07 11:09:49+00	2023-03-29 10:58:17+00	2023-04-07 11:14:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 11:09:46.741+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	\N	a6556f4b-de7e-45e9-935b-83f12e9e5a3d	2	2023-04-07 11:09:47.615+00	2023-04-07 11:09:47.615+00
105	2000000309474011	2000000304287264	2000000024770728	com.gethype	get_hype.monthly	21295449	2023-04-07 11:14:49+00	2023-03-29 10:58:17+00	2023-04-07 11:19:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 11:14:44.185+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	\N	6623d183-132f-4a9a-a115-d8890b320722	2	2023-04-07 11:14:44.878+00	2023-04-07 11:14:44.878+00
106	2000000309476850	2000000304287264	2000000024771080	com.gethype	get_hype.monthly	21295449	2023-04-07 11:19:49+00	2023-03-29 10:58:17+00	2023-04-07 11:24:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 11:19:08.377+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	\N	7c9bde93-47f9-4c0f-b349-69da0536d2a4	2	2023-04-07 11:19:09.051+00	2023-04-07 11:19:09.051+00
107	2000000309479445	2000000304287264	2000000024771468	com.gethype	get_hype.monthly	21295449	2023-04-07 11:24:49+00	2023-03-29 10:58:17+00	2023-04-07 11:29:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 11:25:00.06+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	\N	1a364117-3a9a-43d7-8b9b-db9b540cd4f0	2	2023-04-07 11:25:00.993+00	2023-04-07 11:25:00.993+00
108	2000000309482535	2000000304287264	2000000024771942	com.gethype	get_hype.monthly	21295449	2023-04-07 11:29:49+00	2023-03-29 10:58:17+00	2023-04-07 11:34:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 11:29:26.27+00	get_hype.monthly	1	2023-04-07 10:34:45+00	DID_RENEW	\N	78f06a12-dfa2-4049-8667-cbef28d44395	2	2023-04-07 11:29:26.653+00	2023-04-07 11:29:26.653+00
109	2000000309482535	2000000304287264	2000000024771942	com.gethype	get_hype.monthly	21295449	2023-04-07 11:29:49+00	2023-03-29 10:58:17+00	2023-04-07 11:34:49+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-07 11:34:50.994+00	get_hype.monthly	0	2023-04-07 10:34:45+00	EXPIRED	VOLUNTARY	94826127-698c-4611-a489-dfe89df4d204	2	2023-04-07 11:34:51.644+00	2023-04-07 11:34:51.644+00
110	2000000310159292	2000000304287264	2000000024772304	com.gethype	get_hype.monthly	21295449	2023-04-10 06:44:32+00	2023-03-29 10:58:17+00	2023-04-10 06:49:32+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 06:45:07.432+00	get_hype.monthly	1	2023-04-10 06:44:32+00	SUBSCRIBED	RESUBSCRIBE	37379563-9f55-4de2-a994-7409267a0635	2	2023-04-10 06:45:08.733+00	2023-04-10 06:45:08.733+00
111	2000000310162211	2000000304287264	2000000024886041	com.gethype	get_hype.monthly	21295449	2023-04-10 06:49:32+00	2023-03-29 10:58:17+00	2023-04-10 06:54:32+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 06:49:14.85+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	\N	a1c1af82-ea80-4874-abdd-dfa228b2005d	2	2023-04-10 06:49:15.369+00	2023-04-10 06:49:15.369+00
112	2000000310166522	2000000304287264	2000000024886328	com.gethype	get_hype.monthly	21295449	2023-04-10 06:54:42+00	2023-03-29 10:58:17+00	2023-04-10 06:59:42+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 06:54:56.084+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	\N	9d7e39e4-dcfc-4d48-a17c-d3c822659e23	2	2023-04-10 06:54:57.1+00	2023-04-10 06:54:57.1+00
113	2000000310166522	2000000304287264	2000000024886328	com.gethype	get_hype.monthly	21295449	2023-04-10 06:54:42+00	2023-03-29 10:58:17+00	2023-04-10 06:59:42+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 06:54:56.208+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	BILLING_RECOVERY	28ed3892-b2e1-470c-866e-83f15135e835	2	2023-04-10 06:54:57.164+00	2023-04-10 06:54:57.164+00
114	2000000310171221	2000000304287264	2000000024886643	com.gethype	get_hype.monthly	21295449	2023-04-10 07:00:03+00	2023-03-29 10:58:17+00	2023-04-10 07:05:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:00:21.755+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	\N	7a109ba1-9679-4ecf-9d2e-a1427dcdced5	2	2023-04-10 07:00:23.16+00	2023-04-10 07:00:23.16+00
115	2000000310171221	2000000304287264	2000000024886643	com.gethype	get_hype.monthly	21295449	2023-04-10 07:00:03+00	2023-03-29 10:58:17+00	2023-04-10 07:05:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:00:22.408+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	BILLING_RECOVERY	cb92d13a-b448-4234-85f5-178b3bb70464	2	2023-04-10 07:00:23.243+00	2023-04-10 07:00:23.243+00
116	2000000310174086	2000000304287264	2000000024886968	com.gethype	get_hype.monthly	21295449	2023-04-10 07:05:03+00	2023-03-29 10:58:17+00	2023-04-10 07:10:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:04:39.396+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	\N	45fc6d90-33df-4378-8f63-a0c0c215584d	2	2023-04-10 07:04:40.498+00	2023-04-10 07:04:40.498+00
117	2000000310179671	2000000304287264	2000000024887257	com.gethype	get_hype.monthly	21295449	2023-04-10 07:10:03+00	2023-03-29 10:58:17+00	2023-04-10 07:15:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:10:05.721+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	\N	f574d1a4-5d82-491e-9d23-6a47a21097d0	2	2023-04-10 07:10:06.834+00	2023-04-10 07:10:06.834+00
118	2000000310182932	2000000304287264	2000000024887634	com.gethype	get_hype.monthly	21295449	2023-04-10 07:15:03+00	2023-03-29 10:58:17+00	2023-04-10 07:20:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:14:37.637+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	\N	0439323e-93d2-4c40-afbb-59e086f25c82	2	2023-04-10 07:14:39.083+00	2023-04-10 07:14:39.083+00
119	2000000310186601	2000000304287264	2000000024887931	com.gethype	get_hype.monthly	21295449	2023-04-10 07:20:03+00	2023-03-29 10:58:17+00	2023-04-10 07:25:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:19:53.805+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	\N	b6dcba32-0de9-486f-905a-d83e73e0b040	2	2023-04-10 07:19:54.693+00	2023-04-10 07:19:54.693+00
120	2000000310190928	2000000304287264	2000000024888268	com.gethype	get_hype.monthly	21295449	2023-04-10 07:25:03+00	2023-03-29 10:58:17+00	2023-04-10 07:30:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:24:43.215+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	\N	58472519-3b05-4c38-a919-fbb25fdaee15	2	2023-04-10 07:24:44.598+00	2023-04-10 07:24:44.598+00
121	2000000310194568	2000000304287264	2000000024888688	com.gethype	get_hype.monthly	21295449	2023-04-10 07:30:03+00	2023-03-29 10:58:17+00	2023-04-10 07:35:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:29:15.051+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	\N	3818c040-010c-4314-8a07-15fdfd0e32db	2	2023-04-10 07:29:15.699+00	2023-04-10 07:29:15.699+00
122	2000000310197267	2000000304287264	2000000024889018	com.gethype	get_hype.monthly	21295449	2023-04-10 07:35:03+00	2023-03-29 10:58:17+00	2023-04-10 07:40:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:34:15.279+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	\N	717019a3-dece-4abb-a4fa-0823722ef3a9	2	2023-04-10 07:34:16.037+00	2023-04-10 07:34:16.037+00
123	2000000310201432	2000000304287264	2000000024889391	com.gethype	get_hype.monthly	21295449	2023-04-10 07:40:03+00	2023-03-29 10:58:17+00	2023-04-10 07:45:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:40:14.293+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	\N	83904302-c021-4ca4-883f-507599d096fd	2	2023-04-10 07:40:15.073+00	2023-04-10 07:40:15.073+00
124	2000000310201432	2000000304287264	2000000024889391	com.gethype	get_hype.monthly	21295449	2023-04-10 07:40:03+00	2023-03-29 10:58:17+00	2023-04-10 07:45:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:40:14.545+00	get_hype.monthly	1	2023-04-10 06:44:32+00	DID_RENEW	BILLING_RECOVERY	1c0a5ee8-396b-432f-8893-3bd243878648	2	2023-04-10 07:40:15.424+00	2023-04-10 07:40:15.424+00
125	2000000310201432	2000000304287264	2000000024889391	com.gethype	get_hype.monthly	21295449	2023-04-10 07:40:03+00	2023-03-29 10:58:17+00	2023-04-10 07:45:03+00	1	Auto-Renewable Subscription	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	PURCHASED	2023-04-10 07:45:30.034+00	get_hype.monthly	0	2023-04-10 06:44:32+00	EXPIRED	VOLUNTARY	79b1471b-a440-48c3-8cbd-fbcf5a3e0fc4	2	2023-04-10 07:45:30.994+00	2023-04-10 07:45:30.994+00
126	2000000310358466	2000000304711961	2000000024751590	com.gethype	get_hype.monthly	21295449	2023-04-10 11:07:40+00	2023-03-30 04:43:13+00	2023-04-10 11:12:40+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 11:07:52.476+00	get_hype.monthly	1	2023-04-10 11:07:40+00	SUBSCRIBED	RESUBSCRIBE	7459c6e6-bd7a-491c-82e8-292ab69b2da3	2	2023-04-10 11:07:53.537+00	2023-04-10 11:07:53.537+00
127	2000000310361235	2000000304711961	2000000024906026	com.gethype	get_hype.monthly	21295449	2023-04-10 11:12:40+00	2023-03-30 04:43:13+00	2023-04-10 11:17:40+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 11:12:51.026+00	get_hype.monthly	1	2023-04-10 11:07:40+00	DID_RENEW	\N	36ce588a-49dc-43e6-99ca-dba49ba1c024	2	2023-04-10 11:12:51.909+00	2023-04-10 11:12:51.909+00
128	2000000310364498	2000000304711961	2000000024906382	com.gethype	get_hype.monthly	21295449	2023-04-10 11:17:40+00	2023-03-30 04:43:13+00	2023-04-10 11:22:40+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 11:18:00.614+00	get_hype.monthly	1	2023-04-10 11:07:40+00	DID_RENEW	\N	19777f36-c7da-472d-b22c-ed10857235a5	2	2023-04-10 11:18:01.788+00	2023-04-10 11:18:01.788+00
129	2000000310367619	2000000304711961	2000000024906736	com.gethype	get_hype.monthly	21295449	2023-04-10 11:22:40+00	2023-03-30 04:43:13+00	2023-04-10 11:27:40+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 11:22:34.438+00	get_hype.monthly	1	2023-04-10 11:07:40+00	DID_RENEW	\N	33724532-8cf6-4059-9153-4eff20b398ba	2	2023-04-10 11:22:35.91+00	2023-04-10 11:22:35.91+00
130	2000000310370629	2000000304711961	2000000024907062	com.gethype	get_hype.monthly	21295449	2023-04-10 11:27:40+00	2023-03-30 04:43:13+00	2023-04-10 11:32:40+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 11:27:49.876+00	get_hype.monthly	1	2023-04-10 11:07:40+00	DID_RENEW	\N	e67fe59c-8eec-4a47-a7b7-642e646edc8a	2	2023-04-10 11:27:51.115+00	2023-04-10 11:27:51.115+00
131	2000000310373998	2000000304711961	2000000024907444	com.gethype	get_hype.monthly	21295449	2023-04-10 11:32:40+00	2023-03-30 04:43:13+00	2023-04-10 11:37:40+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 11:32:09.189+00	get_hype.monthly	1	2023-04-10 11:07:40+00	DID_RENEW	\N	e6e7da55-a609-4b9f-a84e-213058ecf32a	2	2023-04-10 11:32:10.461+00	2023-04-10 11:32:10.461+00
132	2000000310377614	2000000304711961	2000000024907758	com.gethype	get_hype.monthly	21295449	2023-04-10 11:37:40+00	2023-03-30 04:43:13+00	2023-04-10 11:42:40+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 11:38:07.201+00	get_hype.monthly	1	2023-04-10 11:07:40+00	DID_RENEW	\N	e2fac7f9-4b5b-4927-b455-1625f666b070	2	2023-04-10 11:38:08.725+00	2023-04-10 11:38:08.725+00
133	2000000310381145	2000000304711961	2000000024908158	com.gethype	get_hype.monthly	21295449	2023-04-10 11:42:40+00	2023-03-30 04:43:13+00	2023-04-10 11:47:40+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 11:42:42.262+00	get_hype.monthly	1	2023-04-10 11:07:40+00	DID_RENEW	\N	7c23a0a2-d3e9-4c8f-a878-b9d1353dbc8d	2	2023-04-10 11:42:42.839+00	2023-04-10 11:42:42.839+00
134	2000000310386886	2000000304711961	2000000024908505	com.gethype	get_hype.monthly	21295449	2023-04-10 11:48:06+00	2023-03-30 04:43:13+00	2023-04-10 11:53:06+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 11:48:16.901+00	get_hype.monthly	1	2023-04-10 11:07:40+00	DID_RENEW	BILLING_RECOVERY	9ba44d51-3112-41c9-8c3b-bb2c6f08f201	2	2023-04-10 11:48:17.606+00	2023-04-10 11:48:17.606+00
135	2000000310386886	2000000304711961	2000000024908505	com.gethype	get_hype.monthly	21295449	2023-04-10 11:48:06+00	2023-03-30 04:43:13+00	2023-04-10 11:53:06+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 11:48:17.004+00	get_hype.monthly	1	2023-04-10 11:07:40+00	DID_RENEW	\N	9637a373-4728-4dd1-bfc7-d6a22ad9c9a9	2	2023-04-10 11:48:18.132+00	2023-04-10 11:48:18.132+00
136	2000000310386886	2000000304711961	2000000024908505	com.gethype	get_hype.monthly	21295449	2023-04-10 11:48:06+00	2023-03-30 04:43:13+00	2023-04-10 11:53:06+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 11:51:24.693+00	get_hype.monthly	0	2023-04-10 11:07:40+00	DID_CHANGE_RENEWAL_STATUS	AUTO_RENEW_DISABLED	cb9124d8-756f-410d-8a0e-0267c060b6b5	2	2023-04-10 11:51:26.403+00	2023-04-10 11:51:26.403+00
137	2000000310386886	2000000304711961	2000000024908505	com.gethype	get_hype.monthly	21295449	2023-04-10 11:48:06+00	2023-03-30 04:43:13+00	2023-04-10 11:53:06+00	1	Auto-Renewable Subscription	7d812252-ad98-434a-98af-ba059971b67f	PURCHASED	2023-04-10 12:00:13.361+00	get_hype.monthly	0	2023-04-10 11:07:40+00	EXPIRED	VOLUNTARY	46849436-c005-4d17-8f3d-47b4b81f0d24	2	2023-04-10 12:00:14.085+00	2023-04-10 12:00:14.085+00
138	2000000310964728	2000000304711961	2000000024908956	com.gethype	get_hype.monthly	21295449	2023-04-11 10:03:36+00	2023-03-30 04:43:13+00	2023-04-11 10:08:36+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:04:12.355+00	get_hype.monthly	1	2023-04-11 10:03:36+00	SUBSCRIBED	RESUBSCRIBE	1133b5c6-d1e3-4240-bcaa-8f3a5d2f9e02	2	2023-04-11 10:04:13.783+00	2023-04-11 10:04:13.783+00
139	2000000310969073	2000000304711961	2000000024982055	com.gethype	get_hype.monthly	21295449	2023-04-11 10:08:36+00	2023-03-30 04:43:13+00	2023-04-11 10:13:36+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:08:36.496+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	\N	98c968ae-9277-4b14-8a0d-d67e1fd2be20	2	2023-04-11 10:08:38.241+00	2023-04-11 10:08:38.241+00
140	2000000310972912	2000000304711961	2000000024982554	com.gethype	get_hype.monthly	21295449	2023-04-11 10:13:37+00	2023-03-30 04:43:13+00	2023-04-11 10:18:37+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:14:02.534+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	BILLING_RECOVERY	b750c729-c971-49a8-bff2-ab0a8497d209	2	2023-04-11 10:14:03.2+00	2023-04-11 10:14:03.2+00
141	2000000310972912	2000000304711961	2000000024982554	com.gethype	get_hype.monthly	21295449	2023-04-11 10:13:37+00	2023-03-30 04:43:13+00	2023-04-11 10:18:37+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:14:02.636+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	\N	dae1fec4-40eb-48bf-88dd-6fbb554a6da1	2	2023-04-11 10:14:03.82+00	2023-04-11 10:14:03.82+00
142	2000000310976238	2000000304711961	2000000024983044	com.gethype	get_hype.monthly	21295449	2023-04-11 10:19:18+00	2023-03-30 04:43:13+00	2023-04-11 10:24:18+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:19:57.864+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	\N	557499cb-5a5f-4973-bf0d-c15228241741	2	2023-04-11 10:19:58.628+00	2023-04-11 10:19:58.628+00
143	2000000310976238	2000000304711961	2000000024983044	com.gethype	get_hype.monthly	21295449	2023-04-11 10:19:18+00	2023-03-30 04:43:13+00	2023-04-11 10:24:18+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:19:57.782+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	BILLING_RECOVERY	b0cef2e2-4dc7-4cbc-b3e8-3c512b73be19	2	2023-04-11 10:19:58.993+00	2023-04-11 10:19:58.993+00
144	2000000310981320	2000000304711961	2000000024983602	com.gethype	get_hype.monthly	21295449	2023-04-11 10:27:38+00	2023-03-30 04:43:13+00	2023-04-11 10:32:38+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:27:50.013+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	\N	1654389e-a648-4270-ac32-d79e68aa36e2	2	2023-04-11 10:27:50.939+00	2023-04-11 10:27:50.939+00
145	2000000310981320	2000000304711961	2000000024983602	com.gethype	get_hype.monthly	21295449	2023-04-11 10:27:38+00	2023-03-30 04:43:13+00	2023-04-11 10:32:38+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:27:49.364+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	BILLING_RECOVERY	48fc4da7-0b93-4148-8106-f3c873d3a43d	2	2023-04-11 10:27:51.102+00	2023-04-11 10:27:51.102+00
146	2000000310985993	2000000304711961	2000000024984383	com.gethype	get_hype.monthly	21295449	2023-04-11 10:33:01+00	2023-03-30 04:43:13+00	2023-04-11 10:38:01+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:33:20.523+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	\N	08047cf9-233d-4cb5-95b8-d4ac38160609	2	2023-04-11 10:33:21.655+00	2023-04-11 10:33:21.655+00
147	2000000310985993	2000000304711961	2000000024984383	com.gethype	get_hype.monthly	21295449	2023-04-11 10:33:01+00	2023-03-30 04:43:13+00	2023-04-11 10:38:01+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:33:20.429+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	BILLING_RECOVERY	44f2fcae-47d8-4ad8-b64a-23c0a7ec8821	2	2023-04-11 10:33:21.73+00	2023-04-11 10:33:21.73+00
148	2000000310989090	2000000304711961	2000000024984855	com.gethype	get_hype.monthly	21295449	2023-04-11 10:38:01+00	2023-03-30 04:43:13+00	2023-04-11 10:43:01+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:37:25.285+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	\N	037fa0c0-2660-4861-8148-9933b5aa0101	2	2023-04-11 10:37:27.36+00	2023-04-11 10:37:27.36+00
149	2000000310994250	2000000304711961	2000000024985244	com.gethype	get_hype.monthly	21295449	2023-04-11 10:43:01+00	2023-03-30 04:43:13+00	2023-04-11 10:48:01+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:42:29.307+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	\N	393ec7d4-f1e6-4108-a453-c2d348a07353	2	2023-04-11 10:42:30.568+00	2023-04-11 10:42:30.568+00
150	2000000310997494	2000000304711961	2000000024985710	com.gethype	get_hype.monthly	21295449	2023-04-11 10:48:01+00	2023-03-30 04:43:13+00	2023-04-11 10:53:01+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:48:08.206+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	\N	eb845cd9-6f73-4d90-befe-1f91ba392ff0	2	2023-04-11 10:48:09.255+00	2023-04-11 10:48:09.255+00
151	2000000311002071	2000000304711961	2000000024986192	com.gethype	get_hype.monthly	21295449	2023-04-11 10:54:45+00	2023-03-30 04:43:13+00	2023-04-11 10:59:45+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:55:07.199+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	BILLING_RECOVERY	5f967486-0dc4-43c4-8f22-6ae6cae325b4	2	2023-04-11 10:55:07.998+00	2023-04-11 10:55:07.998+00
152	2000000311002071	2000000304711961	2000000024986192	com.gethype	get_hype.monthly	21295449	2023-04-11 10:54:45+00	2023-03-30 04:43:13+00	2023-04-11 10:59:45+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 10:55:07.094+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	\N	94119dca-54af-451f-93eb-389faefb26f7	2	2023-04-11 10:55:08.191+00	2023-04-11 10:55:08.191+00
153	2000000311006835	2000000304711961	2000000024986844	com.gethype	get_hype.monthly	21295449	2023-04-11 10:59:59+00	2023-03-30 04:43:13+00	2023-04-11 11:04:59+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 11:00:12.63+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	\N	c287e3bf-2528-4914-b1a8-e81ccab17cab	2	2023-04-11 11:00:13.375+00	2023-04-11 11:00:13.375+00
154	2000000311006835	2000000304711961	2000000024986844	com.gethype	get_hype.monthly	21295449	2023-04-11 10:59:59+00	2023-03-30 04:43:13+00	2023-04-11 11:04:59+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 11:00:12.517+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	BILLING_RECOVERY	85964f5c-54a4-4c52-9975-09ce35291582	2	2023-04-11 11:00:14.066+00	2023-04-11 11:00:14.066+00
155	2000000311009704	2000000304711961	2000000024987268	com.gethype	get_hype.monthly	21295449	2023-04-11 11:04:59+00	2023-03-30 04:43:13+00	2023-04-11 11:09:59+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 11:04:10.261+00	get_hype.monthly	1	2023-04-11 10:03:36+00	DID_RENEW	\N	1dc86b41-259e-4944-a59f-b561e6c71b08	2	2023-04-11 11:04:10.855+00	2023-04-11 11:04:10.855+00
156	2000000311009704	2000000304711961	2000000024987268	com.gethype	get_hype.monthly	21295449	2023-04-11 11:04:59+00	2023-03-30 04:43:13+00	2023-04-11 11:09:59+00	1	Auto-Renewable Subscription	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	PURCHASED	2023-04-11 11:10:05.624+00	get_hype.monthly	0	2023-04-11 10:03:36+00	EXPIRED	VOLUNTARY	f9d45275-4752-4918-9a52-7acaa2fe7f91	2	2023-04-11 11:10:06.502+00	2023-04-11 11:10:06.502+00
157	2000000311438731	2000000304711961	2000000024987589	com.gethype	get_hype.monthly	21295449	2023-04-12 05:43:03+00	2023-03-30 04:43:13+00	2023-04-12 05:48:03+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 05:43:26.256+00	get_hype.monthly	1	2023-04-12 05:43:03+00	SUBSCRIBED	RESUBSCRIBE	9d4de4b4-b2ac-46a7-87ca-aff190a2b93b	2	2023-04-12 05:43:27.213+00	2023-04-12 05:43:27.213+00
158	2000000311440323	2000000304711961	2000000025048596	com.gethype	get_hype.monthly	21295449	2023-04-12 05:48:03+00	2023-03-30 04:43:13+00	2023-04-12 05:53:03+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 05:47:21.427+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	\N	c67d4bd7-b42e-4c9b-a94a-b49410fc1b73	2	2023-04-12 05:47:26.364+00	2023-04-12 05:47:26.364+00
159	2000000311443688	2000000304711961	2000000025048816	com.gethype	get_hype.monthly	21295449	2023-04-12 05:53:03+00	2023-03-30 04:43:13+00	2023-04-12 05:58:03+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 05:52:31.765+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	\N	6e299ea8-a78f-44bb-92db-53fd3321857c	2	2023-04-12 05:52:33.19+00	2023-04-12 05:52:33.19+00
160	2000000311446276	2000000304711961	2000000025049108	com.gethype	get_hype.monthly	21295449	2023-04-12 05:58:03+00	2023-03-30 04:43:13+00	2023-04-12 06:03:03+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 05:58:11.007+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	\N	9f710945-8573-4ddd-b2fd-45e8f44924f9	2	2023-04-12 05:58:11.906+00	2023-04-12 05:58:11.906+00
161	2000000311448620	2000000304711961	2000000025049386	com.gethype	get_hype.monthly	21295449	2023-04-12 06:03:03+00	2023-03-30 04:43:13+00	2023-04-12 06:08:03+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 06:02:15.203+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	\N	eed5dc28-261f-4a5f-8d4c-ceccb0dda0cd	2	2023-04-12 06:02:16.42+00	2023-04-12 06:02:16.42+00
162	2000000311451559	2000000304711961	2000000025049665	com.gethype	get_hype.monthly	21295449	2023-04-12 06:08:03+00	2023-03-30 04:43:13+00	2023-04-12 06:13:03+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 06:08:07.621+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	\N	a6b44e49-fee5-442b-9f49-25b3274030cf	2	2023-04-12 06:08:08.497+00	2023-04-12 06:08:08.497+00
163	2000000311454737	2000000304711961	2000000025050018	com.gethype	get_hype.monthly	21295449	2023-04-12 06:13:03+00	2023-03-30 04:43:13+00	2023-04-12 06:18:03+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 06:12:50.752+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	\N	924d92fc-0767-4e17-9eef-8f83bac838d7	2	2023-04-12 06:12:51.308+00	2023-04-12 06:12:51.308+00
164	2000000311458898	2000000304711961	2000000025050355	com.gethype	get_hype.monthly	21295449	2023-04-12 06:18:03+00	2023-03-30 04:43:13+00	2023-04-12 06:23:03+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 06:17:21.764+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	\N	31e5e3bc-3a4a-4e28-8cac-93ca776ef0d3	2	2023-04-12 06:17:22.821+00	2023-04-12 06:17:22.821+00
165	2000000311464484	2000000304711961	2000000025050653	com.gethype	get_hype.monthly	21295449	2023-04-12 06:23:03+00	2023-03-30 04:43:13+00	2023-04-12 06:28:03+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 06:22:18.641+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	\N	59fa3497-ba62-4321-8702-2368f531e673	2	2023-04-12 06:22:19.592+00	2023-04-12 06:22:19.592+00
166	2000000311468742	2000000304711961	2000000025050983	com.gethype	get_hype.monthly	21295449	2023-04-12 06:28:03+00	2023-03-30 04:43:13+00	2023-04-12 06:33:03+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 06:27:44.563+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	\N	f57c3426-c973-4b8a-9760-dfe095aa6cb5	2	2023-04-12 06:27:45.751+00	2023-04-12 06:27:45.751+00
167	2000000311472297	2000000304711961	2000000025051354	com.gethype	get_hype.monthly	21295449	2023-04-12 06:33:03+00	2023-03-30 04:43:13+00	2023-04-12 06:38:03+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 06:32:23.994+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	\N	6901d3d6-1a71-4459-9dca-489f64fda17e	2	2023-04-12 06:32:24.799+00	2023-04-12 06:32:24.799+00
168	2000000311477071	2000000304711961	2000000025051694	com.gethype	get_hype.monthly	21295449	2023-04-12 06:38:19+00	2023-03-30 04:43:13+00	2023-04-12 06:43:19+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 06:38:34.224+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	\N	b0d07e92-2306-4ac0-bd0a-2a32921573d2	2	2023-04-12 06:38:35.122+00	2023-04-12 06:38:35.122+00
169	2000000311477071	2000000304711961	2000000025051694	com.gethype	get_hype.monthly	21295449	2023-04-12 06:38:19+00	2023-03-30 04:43:13+00	2023-04-12 06:43:19+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 06:38:33.867+00	get_hype.monthly	1	2023-04-12 05:43:03+00	DID_RENEW	BILLING_RECOVERY	f8a81084-799b-4ef0-9d8d-831eab931aec	2	2023-04-12 06:38:35.299+00	2023-04-12 06:38:35.299+00
170	2000000311477071	2000000304711961	2000000025051694	com.gethype	get_hype.monthly	21295449	2023-04-12 06:38:19+00	2023-03-30 04:43:13+00	2023-04-12 06:43:19+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 06:43:27.819+00	get_hype.monthly	0	2023-04-12 05:43:03+00	EXPIRED	VOLUNTARY	f406fd84-5455-4677-9940-f124fb2b346f	2	2023-04-12 06:43:28.974+00	2023-04-12 06:43:28.974+00
171	2000000311576817	2000000304711961	2000000025052113	com.gethype	get_hype.monthly	21295449	2023-04-12 08:37:51+00	2023-03-30 04:43:13+00	2023-04-12 08:42:51+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 08:38:37.077+00	get_hype.monthly	1	2023-04-12 08:37:51+00	SUBSCRIBED	RESUBSCRIBE	a7bcdcce-a0c1-43ff-b468-dd7c639126a2	2	2023-04-12 08:38:38.105+00	2023-04-12 08:38:38.105+00
172	2000000311581552	2000000304711961	2000000025062398	com.gethype	get_hype.monthly	21295449	2023-04-12 08:42:51+00	2023-03-30 04:43:13+00	2023-04-12 08:47:51+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 08:43:43.855+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	\N	efb34d53-666d-497d-af54-826dbd6f1a36	2	2023-04-12 08:43:44.36+00	2023-04-12 08:43:44.36+00
173	2000000311586641	2000000304711961	2000000025062810	com.gethype	get_hype.monthly	21295449	2023-04-12 08:47:51+00	2023-03-30 04:43:13+00	2023-04-12 08:52:51+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 08:48:13.357+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	\N	9c4cd75b-6a15-42d9-9cac-555eac0dad09	2	2023-04-12 08:48:14.449+00	2023-04-12 08:48:14.449+00
174	2000000311592460	2000000304711961	2000000025063309	com.gethype	get_hype.monthly	21295449	2023-04-12 08:53:32+00	2023-03-30 04:43:13+00	2023-04-12 08:58:32+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 08:53:46.923+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	\N	9c2bb6ad-da2f-4e89-9ead-9c003a068a03	2	2023-04-12 08:53:47.517+00	2023-04-12 08:53:47.517+00
175	2000000311592460	2000000304711961	2000000025063309	com.gethype	get_hype.monthly	21295449	2023-04-12 08:53:32+00	2023-03-30 04:43:13+00	2023-04-12 08:58:32+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 08:53:46.829+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	BILLING_RECOVERY	840a81d8-1fbb-4b6f-95e4-6ed7e9c0b873	2	2023-04-12 08:53:47.559+00	2023-04-12 08:53:47.559+00
176	2000000311595993	2000000304711961	2000000025063878	com.gethype	get_hype.monthly	21295449	2023-04-12 08:58:32+00	2023-03-30 04:43:13+00	2023-04-12 09:03:32+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 08:58:10.623+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	\N	4686ff49-ce1a-4277-ab1b-45baef7c42d8	2	2023-04-12 08:58:11.669+00	2023-04-12 08:58:11.669+00
177	2000000311600411	2000000304711961	2000000025064243	com.gethype	get_hype.monthly	21295449	2023-04-12 09:03:32+00	2023-03-30 04:43:13+00	2023-04-12 09:08:32+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 09:03:20.005+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	\N	b5859423-4df5-4b40-9540-e94a118a1057	2	2023-04-12 09:03:20.934+00	2023-04-12 09:03:20.934+00
178	2000000311603762	2000000304711961	2000000025064733	com.gethype	get_hype.monthly	21295449	2023-04-12 09:08:32+00	2023-03-30 04:43:13+00	2023-04-12 09:13:32+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 09:07:59.905+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	\N	27fa794e-958e-401f-8dc4-70b427b5644f	2	2023-04-12 09:08:01.011+00	2023-04-12 09:08:01.011+00
179	2000000311608282	2000000304711961	2000000025065171	com.gethype	get_hype.monthly	21295449	2023-04-12 09:13:32+00	2023-03-30 04:43:13+00	2023-04-12 09:18:32+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 09:13:20.864+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	\N	b02c890a-f23b-453c-96a7-93d09e7619ae	2	2023-04-12 09:13:21.412+00	2023-04-12 09:13:21.412+00
180	2000000311613631	2000000304711961	2000000025065675	com.gethype	get_hype.monthly	21295449	2023-04-12 09:18:32+00	2023-03-30 04:43:13+00	2023-04-12 09:23:32+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 09:18:39.795+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	\N	e67ef8f2-b397-4c20-9622-233e1d8b24de	2	2023-04-12 09:18:40.796+00	2023-04-12 09:18:40.796+00
181	2000000311617729	2000000304711961	2000000025066152	com.gethype	get_hype.monthly	21295449	2023-04-12 09:23:32+00	2023-03-30 04:43:13+00	2023-04-12 09:28:32+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 09:22:59.995+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	\N	06117f48-fd95-4ac3-859b-b4413db5d2fc	2	2023-04-12 09:23:01.052+00	2023-04-12 09:23:01.052+00
182	2000000311624216	2000000304711961	2000000025066551	com.gethype	get_hype.monthly	21295449	2023-04-12 09:28:40+00	2023-03-30 04:43:13+00	2023-04-12 09:33:40+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 09:28:58.482+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	BILLING_RECOVERY	6c027e46-be1d-4122-bcc3-833c2c92f796	2	2023-04-12 09:28:59.141+00	2023-04-12 09:28:59.141+00
183	2000000311624216	2000000304711961	2000000025066551	com.gethype	get_hype.monthly	21295449	2023-04-12 09:28:40+00	2023-03-30 04:43:13+00	2023-04-12 09:33:40+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 09:28:58.374+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	\N	c99599b1-83e0-4082-8ed8-dcc536359bdf	2	2023-04-12 09:28:59.29+00	2023-04-12 09:28:59.29+00
184	2000000311629405	2000000304711961	2000000025067166	com.gethype	get_hype.monthly	21295449	2023-04-12 09:34:40+00	2023-03-30 04:43:13+00	2023-04-12 09:39:40+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 09:34:52.587+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	\N	64caa88a-9e0a-4d85-92c1-8a2d1c534db6	2	2023-04-12 09:34:53.909+00	2023-04-12 09:34:53.909+00
185	2000000311629405	2000000304711961	2000000025067166	com.gethype	get_hype.monthly	21295449	2023-04-12 09:34:40+00	2023-03-30 04:43:13+00	2023-04-12 09:39:40+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 09:34:52.676+00	get_hype.monthly	1	2023-04-12 08:37:51+00	DID_RENEW	BILLING_RECOVERY	3b1db78a-ca0f-4ece-9101-f3b4f0857f19	2	2023-04-12 09:34:54.066+00	2023-04-12 09:34:54.066+00
186	2000000311629405	2000000304711961	2000000025067166	com.gethype	get_hype.monthly	21295449	2023-04-12 09:34:40+00	2023-03-30 04:43:13+00	2023-04-12 09:39:40+00	1	Auto-Renewable Subscription	25e7261a-dd11-425c-b01a-5796cf7895c8	PURCHASED	2023-04-12 09:39:44.602+00	get_hype.monthly	0	2023-04-12 08:37:51+00	EXPIRED	VOLUNTARY	a9e80f4e-555b-4c75-9884-ed8baebdd64b	2	2023-04-12 09:39:45.284+00	2023-04-12 09:39:45.284+00
187	2000000312183996	2000000304287264	2000000024889822	com.gethype	get_hype.monthly	21295449	2023-04-13 05:47:56+00	2023-03-29 10:58:17+00	2023-04-13 05:52:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 05:48:11.462+00	get_hype.monthly	1	2023-04-13 05:47:56+00	SUBSCRIBED	RESUBSCRIBE	9ebd794e-1160-48a1-814e-fb32d04247ae	2	2023-04-13 05:48:12.494+00	2023-04-13 05:48:12.494+00
188	2000000312185943	2000000304287264	2000000025140767	com.gethype	get_hype.monthly	21295449	2023-04-13 05:52:56+00	2023-03-29 10:58:17+00	2023-04-13 05:57:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 05:52:31.558+00	get_hype.monthly	1	2023-04-13 05:47:56+00	DID_RENEW	\N	d82838d1-e117-4ec2-b6fe-c1d24fa6386c	2	2023-04-13 05:52:32.425+00	2023-04-13 05:52:32.425+00
189	2000000312188922	2000000304287264	2000000025140999	com.gethype	get_hype.monthly	21295449	2023-04-13 05:57:56+00	2023-03-29 10:58:17+00	2023-04-13 06:02:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 05:57:40.794+00	get_hype.monthly	1	2023-04-13 05:47:56+00	DID_RENEW	\N	626a064f-094f-41ef-a1a2-22ecce8bef44	2	2023-04-13 05:57:41.997+00	2023-04-13 05:57:41.997+00
190	2000000312191929	2000000304287264	2000000025141274	com.gethype	get_hype.monthly	21295449	2023-04-13 06:02:56+00	2023-03-29 10:58:17+00	2023-04-13 06:07:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 06:02:22.188+00	get_hype.monthly	1	2023-04-13 05:47:56+00	DID_RENEW	\N	3a91b1d9-31da-4714-aa88-d310778736f5	2	2023-04-13 06:02:22.748+00	2023-04-13 06:02:22.748+00
191	2000000312196275	2000000304287264	2000000025141513	com.gethype	get_hype.monthly	21295449	2023-04-13 06:07:56+00	2023-03-29 10:58:17+00	2023-04-13 06:12:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 06:07:32.575+00	get_hype.monthly	1	2023-04-13 05:47:56+00	DID_RENEW	\N	b039a7ac-74df-400f-88d9-d8aba360801b	2	2023-04-13 06:07:34.056+00	2023-04-13 06:07:34.056+00
192	2000000312199666	2000000304287264	2000000025141834	com.gethype	get_hype.monthly	21295449	2023-04-13 06:12:56+00	2023-03-29 10:58:17+00	2023-04-13 06:17:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 06:12:39.516+00	get_hype.monthly	1	2023-04-13 05:47:56+00	DID_RENEW	\N	20cffd95-d187-49c3-a109-cc674bd034c0	2	2023-04-13 06:12:41.021+00	2023-04-13 06:12:41.021+00
193	2000000312203847	2000000304287264	2000000025142156	com.gethype	get_hype.monthly	21295449	2023-04-13 06:17:56+00	2023-03-29 10:58:17+00	2023-04-13 06:22:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 06:17:26.833+00	get_hype.monthly	1	2023-04-13 05:47:56+00	DID_RENEW	\N	13379dfe-6614-4727-9d21-3401286edd54	2	2023-04-13 06:17:27.985+00	2023-04-13 06:17:27.985+00
194	2000000312206378	2000000304287264	2000000025142455	com.gethype	get_hype.monthly	21295449	2023-04-13 06:22:56+00	2023-03-29 10:58:17+00	2023-04-13 06:27:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 06:22:15.533+00	get_hype.monthly	1	2023-04-13 05:47:56+00	DID_RENEW	\N	b29e7f13-ebdc-45ac-884e-382d0f737bc0	2	2023-04-13 06:22:17.021+00	2023-04-13 06:22:17.021+00
195	2000000312210367	2000000304287264	2000000025142769	com.gethype	get_hype.monthly	21295449	2023-04-13 06:27:56+00	2023-03-29 10:58:17+00	2023-04-13 06:32:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 06:27:06.475+00	get_hype.monthly	1	2023-04-13 05:47:56+00	DID_RENEW	\N	b8806095-9df7-42c8-aefb-1f43b8b635a1	2	2023-04-13 06:27:07.496+00	2023-04-13 06:27:07.496+00
196	2000000312215263	2000000304287264	2000000025143109	com.gethype	get_hype.monthly	21295449	2023-04-13 06:32:56+00	2023-03-29 10:58:17+00	2023-04-13 06:37:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 06:32:10.306+00	get_hype.monthly	1	2023-04-13 05:47:56+00	DID_RENEW	\N	2b9d9a7c-da5d-4375-836b-a5c5eec97d25	2	2023-04-13 06:32:11+00	2023-04-13 06:32:11+00
197	2000000312219587	2000000304287264	2000000025143492	com.gethype	get_hype.monthly	21295449	2023-04-13 06:37:56+00	2023-03-29 10:58:17+00	2023-04-13 06:42:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 06:37:31.751+00	get_hype.monthly	1	2023-04-13 05:47:56+00	DID_RENEW	\N	9b66a35b-cdd8-4295-8645-41dc4ce963ac	2	2023-04-13 06:37:32.445+00	2023-04-13 06:37:32.445+00
198	2000000312223198	2000000304287264	2000000025143875	com.gethype	get_hype.monthly	21295449	2023-04-13 06:42:56+00	2023-03-29 10:58:17+00	2023-04-13 06:47:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 06:42:25.705+00	get_hype.monthly	1	2023-04-13 05:47:56+00	DID_RENEW	\N	0bde3be3-3a19-438e-a181-36415c891efd	2	2023-04-13 06:42:27.107+00	2023-04-13 06:42:27.107+00
199	2000000312223198	2000000304287264	2000000025143875	com.gethype	get_hype.monthly	21295449	2023-04-13 06:42:56+00	2023-03-29 10:58:17+00	2023-04-13 06:47:56+00	1	Auto-Renewable Subscription	79254c3c-4ce5-48b5-8292-26a89ab2e122	PURCHASED	2023-04-13 06:47:57.13+00	get_hype.monthly	0	2023-04-13 05:47:56+00	EXPIRED	VOLUNTARY	abfec16d-36ca-4e6b-995a-0df557bd73c0	2	2023-04-13 06:47:58.847+00	2023-04-13 06:47:58.847+00
200	2000000313247667	2000000304287264	2000000025144250	com.gethype	get_hype.monthly	21295449	2023-04-14 11:05:10+00	2023-03-29 10:58:17+00	2023-04-14 11:10:10+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:05:32.75+00	get_hype.monthly	1	2023-04-14 11:05:10+00	SUBSCRIBED	RESUBSCRIBE	94157fc5-057e-419c-924f-490db4915929	2	2023-04-14 11:05:33.582+00	2023-04-14 11:05:33.582+00
201	2000000313250554	2000000304287264	2000000025259766	com.gethype	get_hype.monthly	21295449	2023-04-14 11:10:10+00	2023-03-29 10:58:17+00	2023-04-14 11:15:10+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:09:24.149+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	\N	26630730-0398-46cd-b74a-952b433c649c	2	2023-04-14 11:09:24.697+00	2023-04-14 11:09:24.697+00
202	2000000313255344	2000000304287264	2000000025260130	com.gethype	get_hype.monthly	21295449	2023-04-14 11:15:25+00	2023-03-29 10:58:17+00	2023-04-14 11:20:25+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:15:33.153+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	\N	906149f1-d996-438d-8d2b-4d5ac00c4875	2	2023-04-14 11:15:33.721+00	2023-04-14 11:15:33.721+00
203	2000000313255344	2000000304287264	2000000025260130	com.gethype	get_hype.monthly	21295449	2023-04-14 11:15:25+00	2023-03-29 10:58:17+00	2023-04-14 11:20:25+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:15:33.288+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	BILLING_RECOVERY	3edc6953-bf70-4b22-8dba-5672ae0b0947	2	2023-04-14 11:15:34.221+00	2023-04-14 11:15:34.221+00
204	2000000313258132	2000000304287264	2000000025260594	com.gethype	get_hype.monthly	21295449	2023-04-14 11:20:25+00	2023-03-29 10:58:17+00	2023-04-14 11:25:25+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:19:43.919+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	\N	2db4f33b-dd6b-4551-9081-6bfd2ebe50c6	2	2023-04-14 11:19:44.967+00	2023-04-14 11:19:44.967+00
205	2000000313264460	2000000304287264	2000000025260944	com.gethype	get_hype.monthly	21295449	2023-04-14 11:26:09+00	2023-03-29 10:58:17+00	2023-04-14 11:31:09+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:26:28.084+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	BILLING_RECOVERY	19839785-2077-4180-9d92-8bcc0eab1c1f	2	2023-04-14 11:26:28.814+00	2023-04-14 11:26:28.814+00
206	2000000313264460	2000000304287264	2000000025260944	com.gethype	get_hype.monthly	21295449	2023-04-14 11:26:09+00	2023-03-29 10:58:17+00	2023-04-14 11:31:09+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:26:28.171+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	\N	e981cb9f-301b-4f75-9289-bebeba25900a	2	2023-04-14 11:26:28.888+00	2023-04-14 11:26:28.888+00
207	2000000313268456	2000000304287264	2000000025261442	com.gethype	get_hype.monthly	21295449	2023-04-14 11:31:09+00	2023-03-29 10:58:17+00	2023-04-14 11:36:09+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:30:40.746+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	\N	2cb67e9c-519c-4eff-8f76-bad9a8637da7	2	2023-04-14 11:30:41.404+00	2023-04-14 11:30:41.404+00
208	2000000313273521	2000000304287264	2000000025261756	com.gethype	get_hype.monthly	21295449	2023-04-14 11:37:20+00	2023-03-29 10:58:17+00	2023-04-14 11:42:20+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:37:30.847+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	\N	e845350c-9979-457d-8770-bfd6251b7d61	2	2023-04-14 11:37:31.439+00	2023-04-14 11:37:31.439+00
209	2000000313273521	2000000304287264	2000000025261756	com.gethype	get_hype.monthly	21295449	2023-04-14 11:37:20+00	2023-03-29 10:58:17+00	2023-04-14 11:42:20+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:37:30.943+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	BILLING_RECOVERY	9fd43ea9-02c2-42bf-97c5-4c69d258aa69	2	2023-04-14 11:37:31.629+00	2023-04-14 11:37:31.629+00
210	2000000313276704	2000000304287264	2000000025262328	com.gethype	get_hype.monthly	21295449	2023-04-14 11:42:20+00	2023-03-29 10:58:17+00	2023-04-14 11:47:20+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:42:00.203+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	\N	02546a29-f0ec-47c9-bc38-3e6c39f2362e	2	2023-04-14 11:42:01.079+00	2023-04-14 11:42:01.079+00
211	2000000313282103	2000000304287264	2000000025262661	com.gethype	get_hype.monthly	21295449	2023-04-14 11:47:29+00	2023-03-29 10:58:17+00	2023-04-14 11:52:29+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:47:38.715+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	\N	8a5b1b9c-109f-4503-8c6d-5e3af650bbe0	2	2023-04-14 11:47:39.649+00	2023-04-14 11:47:39.649+00
212	2000000313282103	2000000304287264	2000000025262661	com.gethype	get_hype.monthly	21295449	2023-04-14 11:47:29+00	2023-03-29 10:58:17+00	2023-04-14 11:52:29+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:47:38.626+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	BILLING_RECOVERY	b6543578-898e-4f5c-b061-96e2c165b7b9	2	2023-04-14 11:47:39.829+00	2023-04-14 11:47:39.829+00
213	2000000313285832	2000000304287264	2000000025263095	com.gethype	get_hype.monthly	21295449	2023-04-14 11:52:29+00	2023-03-29 10:58:17+00	2023-04-14 11:57:29+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:51:55.496+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	\N	b4edb34f-da07-4022-bb8d-92fb70f417aa	2	2023-04-14 11:51:56.137+00	2023-04-14 11:51:56.137+00
214	2000000313291014	2000000304287264	2000000025263428	com.gethype	get_hype.monthly	21295449	2023-04-14 11:58:10+00	2023-03-29 10:58:17+00	2023-04-14 12:03:10+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:58:23.612+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	\N	0fe01d6e-8e0f-4353-8137-673d502a91a0	2	2023-04-14 11:58:24.072+00	2023-04-14 11:58:24.072+00
215	2000000313291014	2000000304287264	2000000025263428	com.gethype	get_hype.monthly	21295449	2023-04-14 11:58:10+00	2023-03-29 10:58:17+00	2023-04-14 12:03:10+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 11:58:23.482+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	BILLING_RECOVERY	20690b51-e486-43e1-b561-b9791314ae84	2	2023-04-14 11:58:24.235+00	2023-04-14 11:58:24.235+00
216	2000000313293232	2000000304287264	2000000025263913	com.gethype	get_hype.monthly	21295449	2023-04-14 12:03:10+00	2023-03-29 10:58:17+00	2023-04-14 12:08:10+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 12:02:24.037+00	get_hype.monthly	1	2023-04-14 11:05:10+00	DID_RENEW	\N	80dd9786-d24e-41df-9194-ff1acec80641	2	2023-04-14 12:02:24.995+00	2023-04-14 12:02:24.995+00
217	2000000313293232	2000000304287264	2000000025263913	com.gethype	get_hype.monthly	21295449	2023-04-14 12:03:10+00	2023-03-29 10:58:17+00	2023-04-14 12:08:10+00	1	Auto-Renewable Subscription	7f5b6fa9-e662-490b-819d-e10fdd790bda	PURCHASED	2023-04-14 12:08:46.723+00	get_hype.monthly	0	2023-04-14 11:05:10+00	EXPIRED	VOLUNTARY	a7ab652d-4b7a-4925-a501-bcac5c994354	2	2023-04-14 12:08:47.78+00	2023-04-14 12:08:47.78+00
1	2000000304287264	2000000304287264	2000000024097179	com.gethype	get_hype.monthly	21295449	2023-03-29 10:58:10+00	2023-03-29 10:58:17+00	2023-03-29 11:03:10+00	1	Auto-Renewable Subscription	8efe3d74-ce12-41da-b676-133a6c07dd43	PURCHASED	2023-03-29 10:58:25.301+00	get_hype.monthly	1	2023-03-29 10:58:10+00	SUBSCRIBED	INITIAL_BUY	95e2e01b-20a0-4223-bb8c-8f8df3f4541b	2	2023-03-29 10:58:25.992+00	2023-03-29 10:58:25.992+00
218	270001498039953	270001498039953	270000676147191	com.gethype	get_hype.yearly	21295449	2023-09-07 15:52:28+00	2023-09-07 15:52:29+00	2024-09-07 15:52:28+00	1	Auto-Renewable Subscription	c1b1395e-c9fa-4de4-b148-07d032e5f763	PURCHASED	2023-09-07 15:53:02.608+00	get_hype.yearly	1	2023-09-07 15:52:28+00	SUBSCRIBED	INITIAL_BUY	4e517b3e-7017-40a5-bce8-90f57768ee5e	5	2023-09-07 15:53:03.242+00	2023-09-07 15:53:03.242+00
219	2000000408722381	2000000408722381	2000000036376266	com.gethype	get_hype.yearly	21295449	2023-09-08 08:40:24+00	2023-09-08 08:40:29+00	2023-09-08 09:40:24+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 08:40:43.725+00	get_hype.yearly	1	2023-09-08 08:40:24+00	SUBSCRIBED	INITIAL_BUY	b1c57de4-c409-4f02-97c0-ced4734e0620	2	2023-09-08 08:40:47.212+00	2023-09-08 08:40:47.212+00
220	2000000408795445	2000000408722381	2000000036376267	com.gethype	get_hype.yearly	21295449	2023-09-08 09:40:24+00	2023-09-08 08:40:29+00	2023-09-08 10:40:24+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 09:39:47.597+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	\N	5a26dba7-09b9-4acc-a7cd-51dfc7a420da	2	2023-09-08 09:39:48.073+00	2023-09-08 09:39:48.073+00
221	2000000408862534	2000000408722381	2000000036382449	com.gethype	get_hype.yearly	21295449	2023-09-08 10:40:24+00	2023-09-08 08:40:29+00	2023-09-08 11:40:24+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 10:40:30.519+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	\N	20a676db-a14a-49df-a60e-a5cf6356a88c	2	2023-09-08 10:40:34.09+00	2023-09-08 10:40:34.09+00
222	2000000408914401	2000000408722381	2000000036388688	com.gethype	get_hype.yearly	21295449	2023-09-08 11:40:24+00	2023-09-08 08:40:29+00	2023-09-08 12:40:24+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 11:40:44.364+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	BILLING_RECOVERY	c18e667d-461a-440a-85cf-3a2ada4b3d0d	2	2023-09-08 11:40:44.705+00	2023-09-08 11:40:44.705+00
223	2000000408914401	2000000408722381	2000000036388688	com.gethype	get_hype.yearly	21295449	2023-09-08 11:40:24+00	2023-09-08 08:40:29+00	2023-09-08 12:40:24+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 11:40:44.439+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	\N	f30718cf-4791-4bb9-b5a8-f95a3cdfac2f	2	2023-09-08 11:40:44.739+00	2023-09-08 11:40:44.739+00
224	2000000408980358	2000000408722381	2000000036394472	com.gethype	get_hype.yearly	21295449	2023-09-08 12:40:30+00	2023-09-08 08:40:29+00	2023-09-08 13:40:30+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 12:40:41.742+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	\N	fcb2421a-d825-4215-a18d-c9a15185c92c	2	2023-09-08 12:40:42.231+00	2023-09-08 12:40:42.231+00
225	2000000408980358	2000000408722381	2000000036394472	com.gethype	get_hype.yearly	21295449	2023-09-08 12:40:30+00	2023-09-08 08:40:29+00	2023-09-08 13:40:30+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 12:40:41.963+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	BILLING_RECOVERY	b9b63d76-3063-4c0f-93e8-5c3155e2ff8a	2	2023-09-08 12:40:42.284+00	2023-09-08 12:40:42.284+00
226	2000000409037433	2000000408722381	2000000036400484	com.gethype	get_hype.yearly	21295449	2023-09-08 13:40:30+00	2023-09-08 08:40:29+00	2023-09-08 14:40:30+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 13:40:21.002+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	\N	0cbfc190-5895-44f5-a3e6-e0aceb1adb9d	2	2023-09-08 13:40:21.407+00	2023-09-08 13:40:21.407+00
227	2000000409083251	2000000408722381	2000000036405844	com.gethype	get_hype.yearly	21295449	2023-09-08 14:40:30+00	2023-09-08 08:40:29+00	2023-09-08 15:40:30+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 14:41:02.462+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	\N	fb7dcb10-2be7-4974-9587-ab2386835d23	2	2023-09-08 14:41:06.388+00	2023-09-08 14:41:06.388+00
228	2000000409122558	2000000408722381	2000000036410865	com.gethype	get_hype.yearly	21295449	2023-09-08 15:40:32+00	2023-09-08 08:40:29+00	2023-09-08 16:40:32+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 15:41:02.644+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	\N	6a32ef66-c5c2-470c-a676-d72f03f98133	2	2023-09-08 15:41:02.984+00	2023-09-08 15:41:02.984+00
229	2000000409122558	2000000408722381	2000000036410865	com.gethype	get_hype.yearly	21295449	2023-09-08 15:40:32+00	2023-09-08 08:40:29+00	2023-09-08 16:40:32+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 15:41:02.702+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	BILLING_RECOVERY	70edc5e4-ac78-463f-bda1-d76c97206910	2	2023-09-08 15:41:03.021+00	2023-09-08 15:41:03.021+00
230	2000000409148604	2000000408722381	2000000036415688	com.gethype	get_hype.yearly	21295449	2023-09-08 16:40:41+00	2023-09-08 08:40:29+00	2023-09-08 17:40:41+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 16:40:54.172+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	\N	06e450fc-3ba6-4c45-be6b-2b0cab1d4bd1	2	2023-09-08 16:40:54.559+00	2023-09-08 16:40:54.559+00
231	2000000409148604	2000000408722381	2000000036415688	com.gethype	get_hype.yearly	21295449	2023-09-08 16:40:41+00	2023-09-08 08:40:29+00	2023-09-08 17:40:41+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 16:40:54.278+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	BILLING_RECOVERY	973d7231-661d-40d9-8ad1-c9ce80325876	2	2023-09-08 16:40:54.602+00	2023-09-08 16:40:54.602+00
232	2000000409171844	2000000408722381	2000000036419776	com.gethype	get_hype.yearly	21295449	2023-09-08 17:40:41+00	2023-09-08 08:40:29+00	2023-09-08 18:40:41+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 17:40:20.917+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	\N	69379903-5c4e-45ab-8079-457824dfe265	2	2023-09-08 17:40:21.272+00	2023-09-08 17:40:21.272+00
233	2000000409194649	2000000408722381	2000000036423227	com.gethype	get_hype.yearly	21295449	2023-09-08 18:40:41+00	2023-09-08 08:40:29+00	2023-09-08 19:40:41+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 18:40:16.401+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	\N	7ddad3e9-446c-4c3c-83ab-43fdb1770ced	2	2023-09-08 18:40:16.832+00	2023-09-08 18:40:16.832+00
234	2000000409213695	2000000408722381	2000000036426422	com.gethype	get_hype.yearly	21295449	2023-09-08 19:40:41+00	2023-09-08 08:40:29+00	2023-09-08 20:40:41+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 19:40:19.499+00	get_hype.yearly	1	2023-09-08 08:40:24+00	DID_RENEW	\N	7194b2e9-2dde-4e3b-a35a-d5c8d7cf9f34	2	2023-09-08 19:40:19.92+00	2023-09-08 19:40:19.92+00
235	2000000409213695	2000000408722381	2000000036426422	com.gethype	get_hype.yearly	21295449	2023-09-08 19:40:41+00	2023-09-08 08:40:29+00	2023-09-08 20:40:41+00	1	Auto-Renewable Subscription	10670a64-f419-48aa-b788-63ed4a3798a7	PURCHASED	2023-09-08 20:40:56.978+00	get_hype.yearly	0	2023-09-08 08:40:24+00	EXPIRED	VOLUNTARY	9cb8408e-0535-4c4e-a93c-9925217395fd	2	2023-09-08 20:40:59.992+00	2023-09-08 20:40:59.992+00
\.


--
-- Data for Name: audioTracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."audioTracks" (id, thumbnail, name, artist, item, category, "userId", "createdAt", "updatedAt") FROM stdin;
d369c58f-99d9-40d8-ae37-9250721c4834	1681109174213-249623469.jpg	Kabira Encore (Yeh Jawaani Hai Deewani)	Arijit Singh & Harshdeep	1681109174214-306851052.mp3	1	0d609944-95c2-42ca-8e8e-5f19147f675e	2023-04-10 06:46:14.263+00	2023-04-10 06:46:14.263+00
c2f165e9-0380-4d33-8737-fdbe9db04728	1681109703189-840108344.jpg	Kesariya	Arijit SIngh	1681109703189-959904117.mp3	2	0d609944-95c2-42ca-8e8e-5f19147f675e	2023-04-10 06:55:03.263+00	2023-04-10 06:55:03.263+00
17c17efc-75bc-4415-af2f-e5ad8fd70813	1681109931471-441730612.jpg	Param sundari	Shreya Ghoshal	1681109931471-295333263.mp3	1	0d609944-95c2-42ca-8e8e-5f19147f675e	2023-04-10 06:58:51.51+00	2023-04-10 06:58:51.51+00
31b14edc-2a74-4b2b-8a37-50dd8cb900aa	1681109979371-938389069.jpg	Dance ka bhoot	Arijit singh	1681109979372-83774431.mp3	2	0d609944-95c2-42ca-8e8e-5f19147f675e	2023-04-10 06:59:39.492+00	2023-04-10 06:59:39.492+00
c4568f74-57d6-43ff-bd9c-6cc8f64e4eff	1681110026500-47940437.jpg	Barishon mein	Darshan Raval	1681110026500-901765372.mp3	3	0d609944-95c2-42ca-8e8e-5f19147f675e	2023-04-10 07:00:26.591+00	2023-04-10 07:00:26.591+00
d3e003a9-11e0-4737-a3ed-f089a3d8801f	1681110131395-618974309.jpg	Dil	Arijit SIngh	1681110131395-929203767.mp3	3	0d609944-95c2-42ca-8e8e-5f19147f675e	2023-04-10 07:02:11.565+00	2023-04-10 07:02:11.565+00
\.


--
-- Data for Name: baseballs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baseballs (id, "gameName", "plateAppearances", singles, doubles, triples, homerun, runs, "strikeOut", "baseOnBalls", "hitByPitches", rbi, "stolenBases", "matchStatus", score, "userId", date, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: basketballs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basketballs (id, "gameName", pointers2, pointers3, "freeThrows", rebounds, assists, steals, blocks, turnover, fouls, "matchStatus", score, "userId", date, "createdAt", "updatedAt") FROM stdin;
d091d671-776b-4958-8b5b-dcbeee9245e1	basketball-2023-06-26	11	11	1	2	1	1	1	1	1	1	12	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-05-31	2023-06-26 11:20:41.416+00	2023-06-26 11:20:41.416+00
\.


--
-- Data for Name: blacklistedUser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."blacklistedUser" (email, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: blocklists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blocklists (id, "userId", "blockedUserId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, "userId", "merchandiseId", qty, size, "subTotal", shipping, total, "createdAt", "updatedAt") FROM stdin;
6fe7dedc-e951-4d94-b35e-db32949e1a76	7d812252-ad98-434a-98af-ba059971b67f	d4069b99-398a-42d3-90a7-8018e9e67f6e	1	m	\N	\N	\N	2023-04-10 12:39:06.538+00	2023-04-10 12:39:06.538+00
9d08f52e-2040-407c-811a-f34f07b963b1	d0247d36-982d-4d82-b552-c28338bcc67c	1d5a69ac-0b09-4163-8e41-47d392b65a44	1	\N	\N	\N	\N	2023-04-11 12:07:34.609+00	2023-04-11 12:07:34.609+00
b6e9c5b0-97cf-42e6-aaac-b9f7d2994f79	929842c0-64eb-4369-96d1-306c4daf8f9d	d4069b99-398a-42d3-90a7-8018e9e67f6e	1	xxl	\N	\N	\N	2023-04-11 12:11:07.55+00	2023-04-11 12:11:07.55+00
6b513a47-383d-4699-94ab-88d45a0c2d64	25e7261a-dd11-425c-b01a-5796cf7895c8	d4069b99-398a-42d3-90a7-8018e9e67f6e	2	m	\N	\N	\N	2023-04-12 06:16:45.747+00	2023-04-12 06:16:45.747+00
8e90392e-5b17-4a44-a17f-a1dbf100a122	10670a64-f419-48aa-b788-63ed4a3798a7	1d5a69ac-0b09-4163-8e41-47d392b65a44	1	\N	\N	\N	\N	2023-10-20 12:57:49.693+00	2023-10-20 12:57:49.693+00
1fd8e532-fd36-4eed-8b10-88899e9211b7	82eeaa00-4577-43eb-8509-f126179b2b56	1d5a69ac-0b09-4163-8e41-47d392b65a44	1	\N	\N	\N	\N	2024-01-24 01:48:34.904+00	2024-01-24 01:48:34.904+00
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, "parentId", "createdAt", "updatedAt") FROM stdin;
2	Cap	1	2023-04-11 11:24:13.868+00	2023-04-11 11:24:13.868+00
3	Legos	3	2023-04-11 11:30:47.718+00	2023-04-11 11:30:47.718+00
4	Mug	1	2023-04-11 11:36:08.906+00	2023-04-11 11:36:08.906+00
1	Shirt	1	2023-04-10 12:33:55.405+00	2023-04-10 12:33:55.405+00
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges (id, "videoId", "thumbnailId", name, "limit", description, "userId", "isControversial", "acceptedCounter", "like", "challengeId", "createdAt", "updatedAt") FROM stdin;
556918d7-89f2-4825-97d9-ccb3457087bf	1706061731211-777547752.mp4	1706061731211-777547752.png	Ice bath	0	4 min ice bath	31b62c8f-213d-4e1b-9695-0609c5170cfb	f	0	0	\N	2024-01-24 02:02:12.97+00	2024-01-24 02:02:12.97+00
4c1aa60b-e727-49b8-b5f2-84608eff3f31	1706061999886-537940539.mp4	1706061999886-537940539.png	\N	\N	\N	e650763e-d8cd-48b8-a978-b12adbf159c4	f	0	0	82c05a27-ecf8-4c4e-83c6-5b45f818c077	2024-01-24 02:06:40.014+00	2024-01-24 02:06:40.014+00
82c05a27-ecf8-4c4e-83c6-5b45f818c077	1698409083935-474290130.mp4	1698409083935-474290130.png	Free kick	0	Soccer practice 	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	t	1	0	\N	2023-10-27 12:18:05.723+00	2024-01-24 02:06:40.024+00
76f9af99-c179-46e6-be5b-ae718d6b817e	1697571601242-628383197.mp4	1697571601242-628383197.png	Lay-up	0	Lay up	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	f	0	0	\N	2023-10-17 19:40:03.551+00	2023-10-17 19:40:03.551+00
d96021bf-ae1a-45aa-8e2a-bf8108892853	1698146834586-930167669.mp4	1698146834586-930167669.png	Goal Kick	0	Goal 	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	f	0	0	\N	2023-10-24 11:27:16.676+00	2023-10-24 11:27:16.676+00
\.


--
-- Data for Name: challengesLikes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."challengesLikes" (id, "userId", items, "createdAt", "updatedAt") FROM stdin;
04105552-fb56-429d-8993-7edd709846c1	74ca1b0a-82f9-4852-b8da-c1b33181a997	{"1680584314018-798030751.mp4":"ca932822-40b1-40f7-8618-9b18137d9ecf","1680608714606-977053138.mp4":"26b37d32-1ecb-42c5-9224-89dcc1c8e9b4","1681190035642-628831719.mp4":"52fcdfb9-f244-41e4-a5e4-5d26af3be361","1681189710291-954228536.mp4":"13351cb7-d84b-461f-85e6-70751db741fb","1681189769795-355845865.mp4":"4628ece6-acf5-4724-a0df-1a4f5348533f"}	2023-04-11 05:09:55.138+00	2023-04-11 06:13:35.203+00
14f3aa54-72b2-40ff-bc96-4635d87eaf45	79254c3c-4ce5-48b5-8292-26a89ab2e122	{"1681276992053-559840503.mp4":"a59cecbb-93d1-4779-aa33-8b9370e63cb5","1681189769795-355845865.mp4":"4628ece6-acf5-4724-a0df-1a4f5348533f","1681189070912-788024122.mp4":"cf2f7a0e-8f46-4ea8-92a2-44063a95890f","1681187346683-429925663.mp4":"23eeacd0-5fcc-42bf-a869-1f3bb704abcc","1681187178388-744421446.mp4":"5e0aff15-138c-4e20-a7c2-833f8851aaa3","1680587057177-389364424.mp4":"35ecda75-7e6e-4ba9-8def-0bb09c5e9cf5","1680584314018-798030751.mp4":"ca932822-40b1-40f7-8618-9b18137d9ecf","1680586696244-467185804.mp4":"2c692f92-1965-4d2d-afa9-3481239bec84","1680793545070-571493240.mp4":"6ad52b33-7b32-4cbc-bc60-b8590a2fee0f"}	2023-04-07 06:16:59.383+00	2023-04-13 05:47:34.099+00
c02ac0b8-1422-4eda-b987-c7e95fc4555d	2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2	{"1680793545070-571493240.mp4":"6ad52b33-7b32-4cbc-bc60-b8590a2fee0f"}	2023-04-08 06:01:56.465+00	2023-04-08 06:01:56.476+00
3b4265e4-b0b1-43c6-842c-c254a5529e9c	719f45fd-4157-4d3b-bbd0-61a8b49def49	{}	2023-06-06 20:18:34.171+00	2023-06-06 20:18:36.319+00
b412c8ef-eb66-44b4-8f19-e388ffc7ceca	dac88882-c1c5-4855-b0e5-56492ef89f08	{"1680608714606-977053138.mp4":"26b37d32-1ecb-42c5-9224-89dcc1c8e9b4","1681189070912-788024122.mp4":"cf2f7a0e-8f46-4ea8-92a2-44063a95890f"}	2023-04-11 04:58:26.314+00	2023-04-11 05:03:49.729+00
c49fd0ff-41c7-418d-ba59-e3bec94b45c9	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	{"1680793545070-571493240.mp4":"6ad52b33-7b32-4cbc-bc60-b8590a2fee0f"}	2023-04-10 06:53:01.231+00	2023-04-10 06:53:01.24+00
c6db97bf-57dc-4c68-8cef-f82826b451b9	7f5b6fa9-e662-490b-819d-e10fdd790bda	{"1681193504783-138497319.mp4":"4df9b2c2-6b1a-4b36-8a7a-d4c6c0faaa02","1681189440361-12018447.mp4":"4d6ca905-408a-4521-af29-154e56a4323d","1681189349947-281661239.mp4":"e1f09edb-0fff-4bac-981f-980e144914b9","1681189218483-985879887.mp4":"6cbcbc26-c840-4b25-9d93-708508aa2439","1681189070912-788024122.mp4":"cf2f7a0e-8f46-4ea8-92a2-44063a95890f","1681187346683-429925663.mp4":"23eeacd0-5fcc-42bf-a869-1f3bb704abcc","1681187178388-744421446.mp4":"5e0aff15-138c-4e20-a7c2-833f8851aaa3","1680586696244-467185804.mp4":"2c692f92-1965-4d2d-afa9-3481239bec84","1680608714606-977053138.mp4":"26b37d32-1ecb-42c5-9224-89dcc1c8e9b4","1680584314018-798030751.mp4":"ca932822-40b1-40f7-8618-9b18137d9ecf","1680793545070-571493240.mp4":"6ad52b33-7b32-4cbc-bc60-b8590a2fee0f"}	2023-04-08 07:11:43.657+00	2023-06-26 11:22:43.479+00
2d395a3c-0dec-4c77-b048-a344f05d68f6	9d5a2086-fc35-49ac-ade4-8690a88db24c	{"1691054702348-138822534.mp4":"bea83267-303f-449a-9e7f-f3bc46d5d95e","1687777674538-303278405.mp4":"f8623bd8-af14-49a4-a34a-ffc78bff284d"}	2023-07-29 05:22:10.568+00	2023-09-02 05:51:27.638+00
e1bbdd83-25bb-4f8d-bdf4-cfa2ea41b939	bcb0c977-a968-4f39-8b3f-efcded0e65e5	{"1694023587013-936994442.mp4":"2a2a1bfd-4bec-4a84-a251-347716b628a8"}	2023-09-07 23:48:42.223+00	2023-09-07 23:48:42.234+00
\.


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.communities (id, "userId", "friendId", "createdAt", "updatedAt") FROM stdin;
7d00685a-6d37-4ffd-b739-2aed5b1179cd	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	{"8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","b80adaef-78ae-4135-96d2-12ec481c758e":"b80adaef-78ae-4135-96d2-12ec481c758e","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c"}	2023-03-30 04:49:00.15+00	2023-04-11 10:04:18.996+00
818bc734-6210-4760-9214-bbd3ce0e8545	7d812252-ad98-434a-98af-ba059971b67f	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","929842c0-64eb-4369-96d1-306c4daf8f9d":"929842c0-64eb-4369-96d1-306c4daf8f9d","cb12df9f-56a2-4e03-8cdf-422e933fd655":"cb12df9f-56a2-4e03-8cdf-422e933fd655","2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2":"2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2","48bb84ff-714f-4e7e-8172-359adfb1f13e":"48bb84ff-714f-4e7e-8172-359adfb1f13e","d8dbc425-be21-4f3a-beab-a37e6397e24f":"d8dbc425-be21-4f3a-beab-a37e6397e24f","9688397f-6b0a-4857-ba38-78d48f536ba3":"9688397f-6b0a-4857-ba38-78d48f536ba3","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","dac88882-c1c5-4855-b0e5-56492ef89f08":"dac88882-c1c5-4855-b0e5-56492ef89f08","976cf3fc-6935-4e69-9de2-df5b256b0ba6":"976cf3fc-6935-4e69-9de2-df5b256b0ba6","e3c3ebce-f2c8-403d-9894-b22a4df7fd84":"e3c3ebce-f2c8-403d-9894-b22a4df7fd84","79254c3c-4ce5-48b5-8292-26a89ab2e122":"79254c3c-4ce5-48b5-8292-26a89ab2e122"}	2023-04-10 10:55:43.95+00	2023-04-10 11:30:11.122+00
ed000fc6-4312-4789-afee-9e69b2d9f385	79254c3c-4ce5-48b5-8292-26a89ab2e122	{"456b9492-371f-4b46-b627-92d50651e53b":"456b9492-371f-4b46-b627-92d50651e53b","c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","b80adaef-78ae-4135-96d2-12ec481c758e":"b80adaef-78ae-4135-96d2-12ec481c758e","cb12df9f-56a2-4e03-8cdf-422e933fd655":"cb12df9f-56a2-4e03-8cdf-422e933fd655","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997"}	2023-04-07 05:11:29.564+00	2023-04-11 09:51:54.118+00
49e81b62-417b-401e-8053-4bf21e66153a	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	{"f6b2b18e-e0fa-414f-b875-1e677074283f":"f6b2b18e-e0fa-414f-b875-1e677074283f"}	2023-06-06 16:28:21.056+00	2023-06-06 16:28:21.084+00
c1e94118-3136-4705-857a-c64ee2646820	456b9492-371f-4b46-b627-92d50651e53b	{"b80adaef-78ae-4135-96d2-12ec481c758e":"b80adaef-78ae-4135-96d2-12ec481c758e"}	2023-04-04 04:02:13.325+00	2023-04-04 04:02:13.344+00
8229b3bc-4440-403e-96cf-884bda820c79	d0247d36-982d-4d82-b552-c28338bcc67c	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","7d812252-ad98-434a-98af-ba059971b67f":"7d812252-ad98-434a-98af-ba059971b67f","8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43"}	2023-04-11 10:03:43.707+00	2023-04-11 10:04:33.663+00
c12b222e-607c-4bd4-9e91-17ea84ddfd3c	25e7261a-dd11-425c-b01a-5796cf7895c8	{"1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","976cf3fc-6935-4e69-9de2-df5b256b0ba6":"976cf3fc-6935-4e69-9de2-df5b256b0ba6","dac88882-c1c5-4855-b0e5-56492ef89f08":"dac88882-c1c5-4855-b0e5-56492ef89f08","8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","7d812252-ad98-434a-98af-ba059971b67f":"7d812252-ad98-434a-98af-ba059971b67f","9688397f-6b0a-4857-ba38-78d48f536ba3":"9688397f-6b0a-4857-ba38-78d48f536ba3","e3c3ebce-f2c8-403d-9894-b22a4df7fd84":"e3c3ebce-f2c8-403d-9894-b22a4df7fd84","d8dbc425-be21-4f3a-beab-a37e6397e24f":"d8dbc425-be21-4f3a-beab-a37e6397e24f","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-12 06:16:08.498+00	2023-04-12 08:36:54.227+00
71640c9d-baf2-4cff-b872-b65529d1f502	7f5b6fa9-e662-490b-819d-e10fdd790bda	{"1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","b80adaef-78ae-4135-96d2-12ec481c758e":"b80adaef-78ae-4135-96d2-12ec481c758e","cb12df9f-56a2-4e03-8cdf-422e933fd655":"cb12df9f-56a2-4e03-8cdf-422e933fd655","929842c0-64eb-4369-96d1-306c4daf8f9d":"929842c0-64eb-4369-96d1-306c4daf8f9d","2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2":"2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2","48bb84ff-714f-4e7e-8172-359adfb1f13e":"48bb84ff-714f-4e7e-8172-359adfb1f13e","657975cc-7b3e-49bd-8dc8-76e5cba3293f":"657975cc-7b3e-49bd-8dc8-76e5cba3293f"}	2023-04-08 06:57:39.705+00	2023-04-12 10:16:09.653+00
5403a3eb-c72d-43f1-90a1-4aacdf6d7815	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	2023-04-12 10:38:08.461+00	2023-04-12 10:38:08.468+00
857f9ab8-f2ca-4a8e-b56d-95ff68f98ce2	a3629d4e-f26f-43cb-9c3e-5461022ff427	{"f6b2b18e-e0fa-414f-b875-1e677074283f":"f6b2b18e-e0fa-414f-b875-1e677074283f"}	2023-06-06 17:13:43.487+00	2023-09-02 05:51:27.64+00
ad5eac86-7dd5-4649-9570-f14b9cec3a07	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	{"8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2":"2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","929842c0-64eb-4369-96d1-306c4daf8f9d":"929842c0-64eb-4369-96d1-306c4daf8f9d","9d5a2086-fc35-49ac-ade4-8690a88db24c":"9d5a2086-fc35-49ac-ade4-8690a88db24c"}	2023-07-29 05:54:16.555+00	2023-10-20 13:01:16.274+00
ffd65519-76b7-41aa-baf7-fe97478f53d2	10670a64-f419-48aa-b788-63ed4a3798a7	{"8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","79254c3c-4ce5-48b5-8292-26a89ab2e122":"79254c3c-4ce5-48b5-8292-26a89ab2e122","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","456b9492-371f-4b46-b627-92d50651e53b":"456b9492-371f-4b46-b627-92d50651e53b","48bb84ff-714f-4e7e-8172-359adfb1f13e":"48bb84ff-714f-4e7e-8172-359adfb1f13e","929842c0-64eb-4369-96d1-306c4daf8f9d":"929842c0-64eb-4369-96d1-306c4daf8f9d","9688397f-6b0a-4857-ba38-78d48f536ba3":"9688397f-6b0a-4857-ba38-78d48f536ba3","976cf3fc-6935-4e69-9de2-df5b256b0ba6":"976cf3fc-6935-4e69-9de2-df5b256b0ba6","25e7261a-dd11-425c-b01a-5796cf7895c8":"25e7261a-dd11-425c-b01a-5796cf7895c8","d8dbc425-be21-4f3a-beab-a37e6397e24f":"d8dbc425-be21-4f3a-beab-a37e6397e24f","dac88882-c1c5-4855-b0e5-56492ef89f08":"dac88882-c1c5-4855-b0e5-56492ef89f08","e3c3ebce-f2c8-403d-9894-b22a4df7fd84":"e3c3ebce-f2c8-403d-9894-b22a4df7fd84","579ce8e1-3110-4035-814e-28e9a13e6ded":"579ce8e1-3110-4035-814e-28e9a13e6ded","f6b2b18e-e0fa-414f-b875-1e677074283f":"f6b2b18e-e0fa-414f-b875-1e677074283f","b550f32f-1900-4782-aa09-8aea504fb0ee":"b550f32f-1900-4782-aa09-8aea504fb0ee","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","473086b3-3778-4b92-ab4c-c11b22421f3c":"473086b3-3778-4b92-ab4c-c11b22421f3c","9d5a2086-fc35-49ac-ade4-8690a88db24c":"9d5a2086-fc35-49ac-ade4-8690a88db24c"}	2023-07-29 05:39:19.474+00	2023-08-03 09:39:45.269+00
546c436d-8957-4ef9-b772-85cb670952c7	9d5a2086-fc35-49ac-ade4-8690a88db24c	{"8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2":"2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2","48bb84ff-714f-4e7e-8172-359adfb1f13e":"48bb84ff-714f-4e7e-8172-359adfb1f13e","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","d8dbc425-be21-4f3a-beab-a37e6397e24f":"d8dbc425-be21-4f3a-beab-a37e6397e24f","dac88882-c1c5-4855-b0e5-56492ef89f08":"dac88882-c1c5-4855-b0e5-56492ef89f08","9688397f-6b0a-4857-ba38-78d48f536ba3":"9688397f-6b0a-4857-ba38-78d48f536ba3","976cf3fc-6935-4e69-9de2-df5b256b0ba6":"976cf3fc-6935-4e69-9de2-df5b256b0ba6","e3c3ebce-f2c8-403d-9894-b22a4df7fd84":"e3c3ebce-f2c8-403d-9894-b22a4df7fd84","576a1e23-df24-452d-ba2a-b06c7a6a8f4c":"576a1e23-df24-452d-ba2a-b06c7a6a8f4c","25e7261a-dd11-425c-b01a-5796cf7895c8":"25e7261a-dd11-425c-b01a-5796cf7895c8","579ce8e1-3110-4035-814e-28e9a13e6ded":"579ce8e1-3110-4035-814e-28e9a13e6ded","2b6aa620-df6c-43a6-92c6-1e4b3de4706b":"2b6aa620-df6c-43a6-92c6-1e4b3de4706b","f6b2b18e-e0fa-414f-b875-1e677074283f":"f6b2b18e-e0fa-414f-b875-1e677074283f","719f45fd-4157-4d3b-bbd0-61a8b49def49":"719f45fd-4157-4d3b-bbd0-61a8b49def49","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","929842c0-64eb-4369-96d1-306c4daf8f9d":"929842c0-64eb-4369-96d1-306c4daf8f9d","b550f32f-1900-4782-aa09-8aea504fb0ee":"b550f32f-1900-4782-aa09-8aea504fb0ee","473086b3-3778-4b92-ab4c-c11b22421f3c":"473086b3-3778-4b92-ab4c-c11b22421f3c","7d812252-ad98-434a-98af-ba059971b67f":"7d812252-ad98-434a-98af-ba059971b67f","a3629d4e-f26f-43cb-9c3e-5461022ff427":"a3629d4e-f26f-43cb-9c3e-5461022ff427","b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9","10670a64-f419-48aa-b788-63ed4a3798a7":"10670a64-f419-48aa-b788-63ed4a3798a7","f8055eec-7438-45a8-aed1-5d46d6a447d3":"f8055eec-7438-45a8-aed1-5d46d6a447d3","8a19651e-6c70-46fe-b81a-81f5330bc2f8":"8a19651e-6c70-46fe-b81a-81f5330bc2f8"}	2023-07-29 05:17:06.452+00	2023-09-02 06:19:21.791+00
42c4e47a-cc71-40e6-8ad5-df6051642cdb	cf6cdab8-0e75-4518-bb37-14b9aba6d267	{"79254c3c-4ce5-48b5-8292-26a89ab2e122":"79254c3c-4ce5-48b5-8292-26a89ab2e122"}	2023-09-05 23:48:49.352+00	2023-09-05 23:48:49.371+00
4fb1fccb-1a67-4538-ac09-fa4f58a36976	c1b1395e-c9fa-4de4-b148-07d032e5f763	{"579ce8e1-3110-4035-814e-28e9a13e6ded":"579ce8e1-3110-4035-814e-28e9a13e6ded","68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3","f55f9574-5100-4cda-b9bf-49811b672031":"f55f9574-5100-4cda-b9bf-49811b672031","228f909e-70d1-4b69-bae8-6f72cfee94aa":"228f909e-70d1-4b69-bae8-6f72cfee94aa","ea23f13c-917c-4329-8344-2964aa418129":"ea23f13c-917c-4329-8344-2964aa418129","b550f32f-1900-4782-aa09-8aea504fb0ee":"b550f32f-1900-4782-aa09-8aea504fb0ee","31b62c8f-213d-4e1b-9695-0609c5170cfb":"31b62c8f-213d-4e1b-9695-0609c5170cfb","82eeaa00-4577-43eb-8509-f126179b2b56":"82eeaa00-4577-43eb-8509-f126179b2b56","e650763e-d8cd-48b8-a978-b12adbf159c4":"e650763e-d8cd-48b8-a978-b12adbf159c4","17caaa25-81bd-4379-acc9-13f67e9d6fa7":"17caaa25-81bd-4379-acc9-13f67e9d6fa7","bbf6c7ba-efb8-47c0-bfaf-bb76cb3d052f":"bbf6c7ba-efb8-47c0-bfaf-bb76cb3d052f"}	2023-09-27 14:10:33.716+00	2024-03-11 17:13:41.993+00
e032c9cd-b35c-4c4a-b9eb-94da0d892613	f55f9574-5100-4cda-b9bf-49811b672031	{"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3","c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2023-09-19 14:09:25.831+00	2023-09-19 14:09:41.16+00
d96630d0-a4e9-4857-9b35-641a6b62b9f6	228f909e-70d1-4b69-bae8-6f72cfee94aa	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2023-09-27 14:19:52.487+00	2023-09-27 14:19:52.497+00
5e07ec52-daa8-40dd-95e7-ba5dedfe3e8d	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	{"47a5dc18-bcc4-4b77-bcea-4c697e2e20c4":"47a5dc18-bcc4-4b77-bcea-4c697e2e20c4","7505e5d1-50a5-41ff-9ef0-6437444ee7fc":"7505e5d1-50a5-41ff-9ef0-6437444ee7fc","bcb0c977-a968-4f39-8b3f-efcded0e65e5":"bcb0c977-a968-4f39-8b3f-efcded0e65e5","0025494c-349d-408b-a53e-4c32b4ab388d":"0025494c-349d-408b-a53e-4c32b4ab388d","c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","ea23f13c-917c-4329-8344-2964aa418129":"ea23f13c-917c-4329-8344-2964aa418129"}	2023-09-07 01:46:28.363+00	2023-10-01 12:40:43.295+00
c4a47fc2-9076-4928-819a-98f2f5ca9747	1894fdf1-5eca-438f-8ebb-5078dd18ff01	{"3aaae493-145b-4393-983c-763fc4d06295":"3aaae493-145b-4393-983c-763fc4d06295","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","929842c0-64eb-4369-96d1-306c4daf8f9d":"929842c0-64eb-4369-96d1-306c4daf8f9d","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2":"2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2","48bb84ff-714f-4e7e-8172-359adfb1f13e":"48bb84ff-714f-4e7e-8172-359adfb1f13e","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","d8dbc425-be21-4f3a-beab-a37e6397e24f":"d8dbc425-be21-4f3a-beab-a37e6397e24f","9688397f-6b0a-4857-ba38-78d48f536ba3":"9688397f-6b0a-4857-ba38-78d48f536ba3","dac88882-c1c5-4855-b0e5-56492ef89f08":"dac88882-c1c5-4855-b0e5-56492ef89f08","976cf3fc-6935-4e69-9de2-df5b256b0ba6":"976cf3fc-6935-4e69-9de2-df5b256b0ba6","25e7261a-dd11-425c-b01a-5796cf7895c8":"25e7261a-dd11-425c-b01a-5796cf7895c8","2b6aa620-df6c-43a6-92c6-1e4b3de4706b":"2b6aa620-df6c-43a6-92c6-1e4b3de4706b","576a1e23-df24-452d-ba2a-b06c7a6a8f4c":"576a1e23-df24-452d-ba2a-b06c7a6a8f4c","579ce8e1-3110-4035-814e-28e9a13e6ded":"579ce8e1-3110-4035-814e-28e9a13e6ded","f6b2b18e-e0fa-414f-b875-1e677074283f":"f6b2b18e-e0fa-414f-b875-1e677074283f","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","719f45fd-4157-4d3b-bbd0-61a8b49def49":"719f45fd-4157-4d3b-bbd0-61a8b49def49","7d812252-ad98-434a-98af-ba059971b67f":"7d812252-ad98-434a-98af-ba059971b67f","b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9","f8055eec-7438-45a8-aed1-5d46d6a447d3":"f8055eec-7438-45a8-aed1-5d46d6a447d3","8a19651e-6c70-46fe-b81a-81f5330bc2f8":"8a19651e-6c70-46fe-b81a-81f5330bc2f8","b550f32f-1900-4782-aa09-8aea504fb0ee":"b550f32f-1900-4782-aa09-8aea504fb0ee","473086b3-3778-4b92-ab4c-c11b22421f3c":"473086b3-3778-4b92-ab4c-c11b22421f3c","a3629d4e-f26f-43cb-9c3e-5461022ff427":"a3629d4e-f26f-43cb-9c3e-5461022ff427","10670a64-f419-48aa-b788-63ed4a3798a7":"10670a64-f419-48aa-b788-63ed4a3798a7","e3c3ebce-f2c8-403d-9894-b22a4df7fd84":"e3c3ebce-f2c8-403d-9894-b22a4df7fd84","cf6cdab8-0e75-4518-bb37-14b9aba6d267":"cf6cdab8-0e75-4518-bb37-14b9aba6d267","7505e5d1-50a5-41ff-9ef0-6437444ee7fc":"7505e5d1-50a5-41ff-9ef0-6437444ee7fc","bcb0c977-a968-4f39-8b3f-efcded0e65e5":"bcb0c977-a968-4f39-8b3f-efcded0e65e5","f55f9574-5100-4cda-b9bf-49811b672031":"f55f9574-5100-4cda-b9bf-49811b672031","100b8123-688c-4af4-9a61-c4e147143aac":"100b8123-688c-4af4-9a61-c4e147143aac","075dd158-26c2-4898-91cd-5572b4aa4dc2":"075dd158-26c2-4898-91cd-5572b4aa4dc2","9d5a2086-fc35-49ac-ade4-8690a88db24c":"9d5a2086-fc35-49ac-ade4-8690a88db24c","c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","a9f935cd-e0e3-4346-9c60-943d01369251":"a9f935cd-e0e3-4346-9c60-943d01369251","188f4035-7df6-41b4-b08d-afc8e5a70a3c":"188f4035-7df6-41b4-b08d-afc8e5a70a3c","ea23f13c-917c-4329-8344-2964aa418129":"ea23f13c-917c-4329-8344-2964aa418129","228f909e-70d1-4b69-bae8-6f72cfee94aa":"228f909e-70d1-4b69-bae8-6f72cfee94aa","68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3","74e7f5f9-d679-40da-959b-59cf9b8dadb4":"74e7f5f9-d679-40da-959b-59cf9b8dadb4"}	2023-10-19 16:01:37.012+00	2023-10-19 16:02:17.585+00
af34c769-d58b-4e2a-9f4b-ba43c45aff30	31b62c8f-213d-4e1b-9695-0609c5170cfb	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2024-01-16 00:47:25.184+00	2024-01-16 00:47:25.191+00
e0447532-8a2d-4980-9e15-af872ef6294f	17caaa25-81bd-4379-acc9-13f67e9d6fa7	{"3ff87fa1-3b13-48dd-9984-95ff58d3ed7b":"3ff87fa1-3b13-48dd-9984-95ff58d3ed7b","c9c1f395-a9f3-4e4d-a7e4-18db8b692aa5":"c9c1f395-a9f3-4e4d-a7e4-18db8b692aa5"}	2024-03-06 17:08:17.151+00	2024-03-06 17:38:02.608+00
db3d292a-bd48-4402-8dff-ce9cc66dcd71	16ed92f3-f879-4699-81b5-e0d8fc6bb890	{"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3","c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","f55f9574-5100-4cda-b9bf-49811b672031":"f55f9574-5100-4cda-b9bf-49811b672031","228f909e-70d1-4b69-bae8-6f72cfee94aa":"228f909e-70d1-4b69-bae8-6f72cfee94aa","31b62c8f-213d-4e1b-9695-0609c5170cfb":"31b62c8f-213d-4e1b-9695-0609c5170cfb"}	2024-01-08 03:48:11.789+00	2024-01-16 00:49:39.116+00
8a7dc0de-301e-4cf1-8b2c-d1e2a67b35b9	b5ad960f-bcbd-4fd5-a8ab-f3e86175cd9a	{"31b62c8f-213d-4e1b-9695-0609c5170cfb":"31b62c8f-213d-4e1b-9695-0609c5170cfb","579ce8e1-3110-4035-814e-28e9a13e6ded":"579ce8e1-3110-4035-814e-28e9a13e6ded","b550f32f-1900-4782-aa09-8aea504fb0ee":"b550f32f-1900-4782-aa09-8aea504fb0ee","473086b3-3778-4b92-ab4c-c11b22421f3c":"473086b3-3778-4b92-ab4c-c11b22421f3c"}	2024-01-16 01:16:40.835+00	2024-01-16 01:17:33.861+00
dff62af2-0e55-4710-b63c-23a1938c6868	e650763e-d8cd-48b8-a978-b12adbf159c4	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2024-01-24 01:38:40.043+00	2024-01-24 01:38:40.049+00
16ec85dd-8759-4a43-9a49-d76c3cb7305e	02d196ee-604d-4b60-9baf-5dc28483a43c	{"02d196ee-604d-4b60-9baf-5dc28483a43c":"02d196ee-604d-4b60-9baf-5dc28483a43c"}	2024-03-11 17:39:31.809+00	2024-03-12 17:22:28.229+00
\.


--
-- Data for Name: countDownClocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."countDownClocks" (id, "userId", items, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: emailInvitees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."emailInvitees" (id, "teamId", emails, "createdAt", "updatedAt") FROM stdin;
d633de16-f4ed-4e3b-9242-f5046bd3c7e4	6fe73af9-eec2-4e94-b23b-3498e11f0de2	{}	2023-04-04 05:00:20.095+00	2023-04-07 04:48:58.108+00
29abf73b-9d70-4f75-adce-a78c3b4fa1d1	bdcb18eb-b9eb-4d41-98b8-5200dd572c16	{}	2023-04-07 05:24:55.323+00	2023-04-07 05:25:56.422+00
adeede28-2d1c-43fb-ba18-681c4243170e	6f329eeb-b98c-4599-9855-b048812c8721	{}	2023-04-07 10:46:56.558+00	2023-04-10 07:28:53.488+00
8dc3397c-27ee-45be-9e52-436cf28ff468	79859e57-421b-46d0-816e-eb3f5bfb2558	{}	2023-04-10 11:29:28.906+00	2023-04-10 11:29:58.529+00
7599e7e0-7ed2-4b4c-ac92-2e8043a4bb82	23dbe06a-9d56-4937-be51-1d80ac021151	{"xcodethemes.test438@gmail.com":"xcodethemes.test438@gmail.com","xcodethemes9@gmail.com":"xcodethemes9@gmail.com"}	2023-04-05 09:41:26.977+00	2023-04-11 11:09:25.191+00
3a8d97ee-f1f2-4b5b-82e9-e0de645c455c	3fc6845e-7b34-4040-b662-7476cde02484	{}	2023-04-12 05:29:28.562+00	2023-04-12 05:42:12.222+00
c22fae1e-477d-4e82-9a41-ae17fea9144a	2ba90ca7-09e7-4eab-bd29-4b04ba104d39	{"dilip@yopmail.com":"dilip@yopmail.com"}	2023-09-13 11:08:32.038+00	2023-09-13 11:08:32.066+00
9ed1aa57-8110-4e8b-b207-2283b6fcc7e1	bf91474d-129e-449b-98e8-8082af726ba3	{"leannamurphy2135@gmail.com":"leannamurphy2135@gmail.com","leannawilliams316@gmail.com":"leannawilliams316@gmail.com"}	2023-09-07 20:01:09.58+00	2023-10-01 14:41:36.499+00
21f9955b-502d-4ac7-a256-a9df491afb3d	f80b272c-6a52-4e83-afea-03e7c130737a	{"leannamurphy2135@gmail.com":"leannamurphy2135@gmail.com"}	2023-10-06 02:53:55.749+00	2023-10-06 02:53:55.765+00
a7175fef-d220-4214-bd5b-46d71c83eb32	630e7b0c-8de3-48e5-b67f-e38e88df4f4a	{"leannamurphy2135@gmail.com":"leannamurphy2135@gmail.com"}	2023-11-11 00:36:42.684+00	2023-11-11 00:36:42.7+00
7c98579b-9b3a-495e-aa8d-aa2811b678b1	dd4e06d2-986e-451d-a750-64f2b335dbb4	{"rmurphy@yittbox.com":"rmurphy@yittbox.com","lgarcia@yittbox.com, leannamurphy2135@gmail":"lgarcia@yittbox.com, leannamurphy2135@gmail"}	2024-01-24 00:48:14.338+00	2024-01-24 00:49:10.259+00
50b9494c-3fbe-4fd8-b382-c16df4fd4f3c	61ddd332-42eb-4858-8e89-c6dbaf2f61c0	{"abel.alem@a2sv.org, avael.alem7@gmail.com":"abel.alem@a2sv.org, avael.alem7@gmail.com","abel.alem@a2sv.org":"abel.alem@a2sv.org","abelalem19@gmal.com":"abelalem19@gmal.com","abel.alem19@gmail.com":"abel.alem19@gmail.com","abelalem19@gmail.com":"abelalem19@gmail.com","dev.abel.alem@gmail.com":"dev.abel.alem@gmail.com","avail.alem7@gmail.com":"avail.alem7@gmail.com","avael.alem7@gmail.com":"avael.alem7@gmail.com"}	2024-02-13 08:10:58.332+00	2024-03-06 19:12:05.906+00
37e123d9-2fde-4f45-987c-ea307d3085bf	252d0b5c-041d-434c-b4a8-53b0f864483a	{"Abel.alem@a2sv.org":"Abel.alem@a2sv.org","abel.alem@a2sv.org":"abel.alem@a2sv.org"}	2024-03-11 18:59:59.082+00	2024-03-15 15:26:40.629+00
d97396fa-2fa9-4c28-8d37-7dd444bbf8dd	2bb721d4-8eed-492e-91a1-580e6946b703	{"abel.alem@a2sv.org":"abel.alem@a2sv.org"}	2024-03-11 16:52:24.755+00	2024-03-15 15:28:48.05+00
3a2338b2-95cc-47d1-b9ce-6756f1aba1de	e0f02e39-ec0c-44bf-a04a-acee1ef1b0be	{"samuelnegalign1@gmail.com":"samuelnegalign1@gmail.com"}	2024-03-07 17:35:59.383+00	2024-03-07 17:56:07.033+00
24cf67fc-c805-4989-973e-cb5812c2f067	917056f4-caf4-43b9-b95b-2e5fca8ebd87	{"brittanymsharp30@gmail.com":"brittanymsharp30@gmail.com"}	2024-01-16 00:41:20.56+00	2024-03-07 18:05:46.82+00
\.


--
-- Data for Name: fcms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fcms ("fcmToken", "userId", "createdAt", "updatedAt") FROM stdin;
du4gIWj0_0oYpGZs8dA6yE:APA91bHQQHdqw2HGsyeVmbi5wIswjbyVYFBa-46cIy6GYmbr9Xud7LCJ3-7aHJOZCJt_wlz4wXGfErTWdQFg3t9rI3I4pQ8dyVDCEJ8f3W1BgiUNZAkmlbm2fHFxYdMY5MNAkrryWHoJ	8efe3d74-ce12-41da-b676-133a6c07dd43	2023-03-29 10:41:41.653+00	2023-03-29 10:41:41.653+00
eI48F2L4SzS_CsPH72ZAgj:APA91bHUG6ncLSpFr52bSVpE9EKNKAKxFga2fpKz7zHVLFO_zAmMdC3rnX_Xx6iLXHMdQcSTfxILeX8nRSlKYSwo1nAD_K8K60SmdPVVTyGO0QooNzhetu1znJxIjEvS91p0MCtYies5	dac88882-c1c5-4855-b0e5-56492ef89f08	2023-04-10 06:21:17.74+00	2023-04-10 06:21:17.74+00
dejXbgR0S9qId4uVPh0OSD:APA91bFc_a7UXnfk9Y02HtPXAi7zaLCFe35IP8Ia3KLYL-Q5fcMFN3xQ9B1pqreD-JKqitaZ23O368tvkAiQX1IpAMrUuByoig1UwRrP-ABpuPuoTbeCnHF3Jxxc7Ft0D-o1cVqIOg_Y	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-04 04:26:51.605+00	2023-04-04 04:26:51.605+00
d_bkZx7qRsmjf06boPrubm:APA91bGrTXcoR4q4R9GjRKfU8C7yS4Z9fmEUck4m65PofJJjCMA_9Yw1X1TuPvQyDUOSLtRnwNjel4K-0WcChZj1cYJ3pcCHjXkehBerAlTkdC82vpx9Lk7XnLva9ZEppIuqiAb3QmMz	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-10 07:26:58.521+00	2023-04-10 07:26:58.521+00
dZwDB5HpQZS0IZu7fHAP4H:APA91bEO8Heq7dcUKQHBzijX99uAGnuPvL_datwFI5j0Z30POMSyBv_tK-DA2OkgnO-nwmkWIV64GDqN3OUvoBzBoegZtJT76fVurK-6-TOZr-Wka0mDupZ3Brz4i8JoeeONWksj-KVy	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-04 05:00:30.319+00	2023-04-04 05:00:30.319+00
eVP5yIZ3TaaITHAn_V754k:APA91bFs6yiy_rPZq2QchbEWFfLC8wZKSY6OWbTnKlNYAfq3W7-kz6saVKQGaS8YEUpDQDhaFB4QA3lu914H1h9BuSJbX-sHvBloa3cdRC7IyNrzMLU-_P2LcNIEC2TGt4mpX8x_jZKz	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-04 05:04:24.399+00	2023-04-04 05:04:24.399+00
fIrgcPxJT3uOe9T6CBvbGv:APA91bELhjF3g0raNPkeoU5kcZMtbMf8bVGSiKupTPe9p7QyC1BsnbXd7RcIk_L2rXAFmY9I9PVEkS7XPeA1FsdmF4MErEVvhQFKDJyVYGU8A8llKr8xS87v7pSSR8HJj6ciykxZiy4J	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-04 05:07:42.218+00	2023-04-04 05:07:42.218+00
c7Cdy99VY0XihJzNP8TTCO:APA91bFIT9xh0fKGrGb6OOsKOViQp_9fm21UVCzua0HtbzLh6B-QxE8tYkI4OOFBvFEWb1IEZxpXgG0YWUJ3Xuntf-Z6IOW8dNI_JZDGnGZFzqpk3KTCV3jstVaM3bpJRNxHB9mxTJSJ	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-10 10:15:30.547+00	2023-04-10 10:15:30.547+00
eooiAvOURUKCvAmZ3g1W61:APA91bFuSzktmptThNotzb2yvJoRZi9LREFJea0xDkpkfvO4EG_2AlAF69OG8T_RRRLWNfEoLv87U0vxybM6bLkyUvROz585uE4SkSCVnwD0cMvmS-Q3M7eTWnE_QsiXdgOq0um9KnB5	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-10 11:25:31.89+00	2023-04-10 11:25:31.89+00
doQe2kJIQAyGIvXle9AbQt:APA91bFY-KkPz50vND6RpcseRjRhodDB_VnH78qM35YETJhIxVLwN2w6EwsWl5rBkryklS_YMW39R3TnDY5podg76z0Qcdk62gtjDho7m1iZsHd-oMRK4YKbYtNjudScWZlShqvhlWND	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-04 11:48:00.65+00	2023-04-04 11:48:00.65+00
eW2w385PLU9YvRb-2D0U-2:APA91bEMy5iOtF1DbOtpiTeUGqFBKQ5susH_A3me7M_8WARehkVFlueTqd2wTdoMW58zx3vExWPSwfjJcKFZo_ABw-W8BBj49gF-Suo4EehplEug5SdyH1R_yTdCqfuVSoKkHvqJnoIj	7d812252-ad98-434a-98af-ba059971b67f	2023-04-10 11:54:56.257+00	2023-04-10 11:54:56.257+00
d75e-fO4tkSGgIavpbJeZp:APA91bFaiD3LDAd9-YdtE1V19cXQ2qnqy_LVZaHlEeVkzCImsVj82PlALTxpb-og2YkAftdLeilOIejo2CdY33XEzUmhFdbl4c7Cy6Uqdh8Hdwzxr-QUuJQ9-MgBNlyl4W1uQB98deLm	929842c0-64eb-4369-96d1-306c4daf8f9d	2023-04-10 12:31:35.064+00	2023-04-10 12:31:35.064+00
eL116TDpmkylnYn8FDmu_G:APA91bFOGT_KxjD7xu7TuPa82vSZhDgU58YaBJytjfe0teIwQ4SN-6zGXGreAcYmpypYVy35qD2SaY_JvGgetHWs5JyUls4Kk2hylWdiqk0mxA3wXtnMX_0mP_SuwqUwMv3Oh90iFpKC	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-11 04:39:24.392+00	2023-04-11 04:39:24.392+00
cNkY3Rlbxk7UqB8NYK69cq:APA91bET85-QNU5DmmJ8bWGXEV6J6K1ooMOlhi8C5YuwmeHV6f-g7L81OYi6GPJ_wgvxz7w8vr1tm-ocz2uCJtFltGw8RQHylGEPiSO0ir5ybUmXCto-wXG8oBhAiMDsstEhKM9YirTQ	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-11 04:54:53.676+00	2023-04-11 04:54:53.676+00
dsA8uSnpHk4hq-8CltMCLo:APA91bFmJNVSUi1hCLvjsA8D-_C0RospV9bZWrGZiRytQ2JbultKMHGHbnpcD7UlZP-lImM9aBpCVy-KgGCNtL-zTfHMC6DVk-SdSVbRno3Jou2yGBem-HpKuYILZDvES6pR46MHPqgV	74ca1b0a-82f9-4852-b8da-c1b33181a997	2023-04-11 05:06:46.175+00	2023-04-11 05:06:46.175+00
diO5_NmWjU29rqLrite_8d:APA91bE6eUYwHfuUoJBgk8qBDKw9PaGYleSWEr-JemsFWRZzhY-FdsKlRLkSs02D-EU47w1lpG_TNHb02xSt2cZlMbdKBAYmw4mOokr0ZTMLITHiWZ1YmMxl6LNOaWUzJ7HMsCG94k-E	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-05 06:22:21.108+00	2023-04-05 06:22:21.108+00
fVyCGW5Qz0fDmPtiuyKrIM:APA91bGDDkFGpg0572_o5DyEa_QQq2fBy9wDVg1Zu-f1Y9FpKAsBIe_Btwq126aRPKxmaiHaXf3wPZT8TOVaTMsbBWkcA5bkoNZESfB3k2Du2V6vw67L9SY0YGitR0Uya7EYy8tx1z7T	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-05 06:37:10.029+00	2023-04-05 06:37:10.029+00
eEb5flvOSwGsWfMCkD1QTD:APA91bGe3RtKUq5frFtB4-Iq4o8sLxLl6TkNsf6HKgL4WnGpmTpWn0HHHiVfz0GvGI4yS8VdjlSejIe_qilV23gQS_KCojT0RUQI3LJMqmZitjVdq9hYsZ4ac3bGaVfm0ATAb2_aDcvl	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-11 06:15:10.985+00	2023-04-11 06:15:10.985+00
d-3kS-lcdECAlUIjc0B1T0:APA91bEaQVpJkZee5eR0F8dsLOeyOJtUfMP6Y5y7X5A0T1fVFwPxNfxmnjxtfH8Ygu6PhC6CHo9i7NCe6nGq53UAYdsjL4I54jzSxI1CHkOe37MosMYwRZtxHMO9ufRAp7UdXlQ_3aD-	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-05 10:18:37.548+00	2023-04-05 10:18:37.548+00
ffByd0pNQwuHZS-3YGM67S:APA91bFeWcrIyGoQyXDg-XxT0eUEDNSRxSztWTGX1lSqBN3XDVO8D44Ii-4HFuW7xDPEkZowNbquczkNhwv7BEQOyRUujAWyzcnPM81V6yo3TiXyTCLr-9qP1AI6H1M6HNcMy3l5Tcvc	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-05 10:39:27.568+00	2023-04-05 10:39:27.568+00
dJNb8mchRoaOrU0bZxIJbu:APA91bETuzF_Ura72TN6cvyKYqv1PQA5lsiWSP123DDeb_PevZRfsNY5VaISMWDLUfunNPNsh2xWNZ0NhwvZ8-o2gHk4_6slLB4ipQWWLS_WVJ_vEWlSHNDUiL9O2gOSrGpxE6MXWL4I	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-05 11:11:34.303+00	2023-04-05 11:11:34.303+00
fjX6ElH5TLu3kdfcXo4cRA:APA91bHdX-vlo0RwW6VmiCnOEipy-a4LAkw-Pjqr_hBppiIh-e9iv2N95U2luHS9t-M1VJex5Y-yiA-c_onItbv1X3CaUqW_E9kISX5gKi3W0JNxmyrybip_SET1_4-ENsVmDW4R1t7X	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-05 12:03:58.101+00	2023-04-05 12:03:58.101+00
cH40fF945UeGh8r6TuiLrm:APA91bHOltSxY09zBpDaj_ptMQ_dapK6RkdFFAa0pMYya6j_Dz_agtfGeU1_COPiu0IJdMv64h0_4Z5mPufX9ExmLQYZO3KLVWOBW08odljl68j--YYjIeXn4TNNlOX0Fq-bPHTJqjXW	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-11 06:51:35.572+00	2023-04-11 06:51:35.572+00
eCXglP0H4EpQgHTqAvEMTO:APA91bHvhusGwy4wfXLAWz-ozdGTRoeP0Y4Pf5SpS9aPTlpgn6emXWK9k1kYSZ2Mb5VEd88f1cTR6dXnO-0NpGU_2lqpGkc12Pcx3LAX0GzeLt1VU3_g75DK0swzhmbEhcvh4j9CTQTO	456b9492-371f-4b46-b627-92d50651e53b	2023-04-07 04:44:21.821+00	2023-04-07 04:44:21.821+00
crPCrM9qXk9_kxY2Pm65Qc:APA91bH8ReuUowCwXcvEkFS-rWfvYebr65fKEseg_y1EzwgTKqR_ywl_BFHpdVy4IfwyaGRHsToy1TvYJIalWR5NriP65m3HxSGSLMO_jmvG0lI4Tq6siiGLynlVTeU8hLIcsx7RZkFZ	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-07 04:47:59.484+00	2023-04-07 04:47:59.484+00
f-_ZpAjNLELttqvgrdQ5gz:APA91bG2vt4mO_ZlCoLwcpnprOkSAe-eiuGXAeCwzhkw-tACwTToMB0XHlipQElpAZQBeO2s--59Dm9YXuUsuI2HlEQmdgG0JOYmzRwDjeTYjKEQJOrinUtr2O75a7_lAOS82528FL_W	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-11 10:06:03.265+00	2023-04-11 10:06:03.265+00
c0rgi-LVIUXItN5ckJoMVI:APA91bHPR3iCYwV3Knixr3kTa4kEfVfRkNXfPnkO73rinsqykuusKZaQ7hJOHszt9Tq2-CbHOvuULJ7jcugGNPYVdqVuzIGomIynGWKEdYXxs_Gulk0oA8xgm0v_6gdrw2PvrfRMrGdS	456b9492-371f-4b46-b627-92d50651e53b	2023-04-07 05:28:58.173+00	2023-04-07 05:28:58.173+00
fN73-P-S-kTgmBPSJtuF5a:APA91bHdInxplDVpVWhnqBqnWrdLuwSChFyQQb805BemZ9wkf5Z621eXD1gOhYG32W5dPt9M_7qyyqPZqbsOMVvFiApyvNsLKvccMyc2tt3PEP-Mbv1UmgNGKaHdNMuC0KXBQHSg1Rql	d0247d36-982d-4d82-b552-c28338bcc67c	2023-04-11 11:34:02.584+00	2023-04-11 11:34:02.584+00
eL8XL2r2GUSvoUF1QXl8lS:APA91bGU9Goo15j96a443iLbZo6nLQxhTO0472G0NrPdCERO3r5ZQSwbx4PxO4pepPDzYaskVPPKWD39xBrNOzDfumoEGVAaMXDDDJHjmSqPd85WZzfyqhEuUUPjraN5u6GW83SITELR	929842c0-64eb-4369-96d1-306c4daf8f9d	2023-04-11 12:10:48.342+00	2023-04-11 12:10:48.342+00
cUneJaNkTEufxR8v8Mi97v:APA91bFnDx93F6KyxiTk_J1oW5vxv3o0do_VnAGs9OO9NQTdoSDnSgb-hGOw-EQlc08Pf57s_1z7IdBBUzdlucYKHqXqLNlrT0kZNmkA5CZudZg8fgcMD7cyPvqGbsctVIO-__5Jo6oE	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-07 06:35:12.225+00	2023-04-07 06:35:12.225+00
drDWyzWDJE4NlcddU2Zohm:APA91bGxP2kcwkInLT-9D4uSM33e5DGSfcWB1vpqjvz-O41u5XGdCxcXFTgqFg0F8n1Ly40f0g5g8kCI5XKuw-JSbXXqVzsE67SeyQfQ8mvj6utWyBA0YMSzRF3HtQXrakWKq2QTRbwo	657975cc-7b3e-49bd-8dc8-76e5cba3293f	2023-04-12 05:08:32.45+00	2023-04-12 05:08:32.45+00
cOKZpt7bTuqR_uxuGkj7uU:APA91bFy3iYTAnJr5sQh0-F8CwTbo5WU3j3cDyZcn5F0U9u_-kkCfW6SzboyjZkPmeYDvmZbZUf6uKqrDYWOfTJ0k9B4uaLnnIS5kfgnO1gx6y3_B0XsZGwx3lFfHERuN6quO8rhinUG	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-07 08:38:22.435+00	2023-04-07 08:38:22.435+00
cZpbv1cUe072qOw831rgpL:APA91bE7UhSVQKQXhDrYYjvy8CH1Hef_gBL225liYcXl1CqtpfBjrpple-dESdDTdW0P6TtQ1NAygXusOKplceniaWxeP5_LI5jMZe8lOu9osbNir_bHxrgYHzc3s5qF2NktCvSY0N48	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-08 07:06:35.676+00	2023-04-08 07:06:35.676+00
cIiz82YNhE0fo3Xg08bVIV:APA91bGvL77bHj1vMozNpO3BU5k-Mvisk0iF5DV_y4LUfDpDU15BPN7aV9ljw-Yk4dhS0DeejqfdBshIh2TZ5qdCBqg6nRSI9X7UXN1qBe6ws-iXGeEiCoL2OtWR4XmvBFb-YlrrOUIl	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-14 10:47:55.841+00	2023-04-14 10:47:55.841+00
dS7WfYOWTGyFJ45HbuySMM:APA91bFXrR7aHrYLdh_GVhHg-9Jq5kOxP652R__hnYko3zxg-HtzCj6IFlRjHa05yhEGINd8Ra4O5mqJdav6cKcAnpU-9UXo-f0MaFH-FF9X4NeTEsd39bPqyLWQeVxz4dM-XY_dc0YD	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-07 10:15:40.191+00	2023-04-07 10:15:40.191+00
eU3RzTZ50UE3koZ4PIRDpx:APA91bHaV1M51-6rG_qR7DaaN1bIsE6V19TgKUIf320HDg2-UjQwmdYFC6AVm4kY32IFmRuqohZq_epFy6KQszRi9qUPPE_x_JthFvb2uWqQm-0A20zxxqtTkGZJ5HfdsCySbeOqK95D	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-07 10:17:20.223+00	2023-04-07 10:17:20.223+00
cz_2V0eMRmaDXz5qK0ajmM:APA91bEdwHlG0C2Hm7ORmRdPJ41VRxeN9edL7F3mxPU9z0fCzreKe6zmz1YIoprlngXZVgGxqanuogQEOW_wVrO4ttTY-CvQcKkbnGFbkbtf3okoRyQCS5h2cEYhtoh1Ax0jmQyKIyv1	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-07 10:30:42.656+00	2023-04-07 10:30:42.656+00
eAQp-en3kEDmrsyXj3e9zJ:APA91bHEtTSm_BiZaOUDDNeSSNqUWuVtHnwG6SD9wbo0D2QoTnKWVE0iDglRg5HaybsKW3VuFrnaySCxnjviWp4AdaJ0YVnNErs6gxYaj1txjLiqJ6emWN7srFvFnRRS7Lxvei0-OAUy	dac88882-c1c5-4855-b0e5-56492ef89f08	2023-04-10 06:16:36.065+00	2023-04-10 06:16:36.065+00
eJvEPPyEsExHqtkr2eUckI:APA91bEuZdDdN9MZmI1wKk3m5oEIsiM-zWAKuun_J6uCRvbazs1aagi2i6raHEzzjzvtTlrr-wLzcs-nnBC1rlkBtx2IJw9CPMcNUOTNv-3WcDm8pPW6G4CCRm2LSPyukjE_NOfM-DaV	dac88882-c1c5-4855-b0e5-56492ef89f08	2023-04-10 06:27:07.443+00	2023-04-10 06:27:07.443+00
egqG2z-qOUIerNWesji1W6:APA91bFkgwOPR26dZozob5o-b6leTUr8TlhM9eW1K08wLFEFRi6GNr9DCRK63NgrdcYj3Yo08S7t7wqo-D4UxT86DupRlMIQjxFrKzmdOKmCuP3YJp3H4HvzLBCG4qYSiVkeW_-C7HeR	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-14 11:08:33.116+00	2023-04-14 11:08:33.116+00
ejgKLjuHTMmEPVIamJMveC:APA91bGxq2wcnjp0q4rPGO1NE48hF7We0jAeDl8H6KZjP27117LfP3CX0DqewdHE7peh87ckyqDfeEmSa06W0qnsjy6OVvOLCXjUIAvWgAjbEiVrVnTQjXVySgG1TbJxhmtpZYxBd-Bc	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	2023-04-14 11:36:39.649+00	2023-04-14 11:36:39.649+00
fyzTEC9Mb0kSkcMJsCqH1-:APA91bHf0Jdv9r5zW8P0zFuZQ0S6yj8Juey8__8U0BGuqE_QsQj3lUbqNCQvUBvlfV_phGqW83TMrvTSrS_-1ZPGzDk8xfxqc1PtV4P63foyiN5_5z7dcuNydMku6lpBwLF_KiHXrrxC	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-10 07:27:54.044+00	2023-04-10 07:27:54.044+00
eberKLbPp0DFhRPIGy4Zxy:APA91bFQ9NaPkv6p0R32VU_pOrZh4GGMtXK8BeP0JGGbcMI7kd6tr7W5i0lLGxmSM8M4DPYAD7QduS3gp8JFoSKg9CYIgKKKM9i_4Q_pOI_CzVoKZGFSifYQNuLkf7EgC90IAwu2mjWB	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-14 11:47:36.4+00	2023-04-14 11:47:36.4+00
eVRepY0P8UC2nIdJ5yCIaA:APA91bFO6JUGHBPENTeGUwuzdDA0hnfAS3iwM0N7iH_pkuMBn1p5MmnzS495y5OEUaXdfaB1oFCqVIWcvyFyYFBUASvE2kUvdPukMkLfu6uLegiGx_SohqrmRbKaPf4V_wj_QbMXrc3A	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-10 10:24:43.431+00	2023-04-10 10:24:43.431+00
e7zryiW1TERPuzy0e3zntS:APA91bGZo1vvGqoP9t4XAsIhfUkU0_8fxVqeKSRZiOGowGZq9ompmcQb0PifVV-nHaWa2CBJeSYC1xULo_HDk0a4k0I0SrGXi0-ZXyX-_RlVL9qu3s9GGhuMzpytEQnGkt5AfHdbCDOo	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-10 11:27:58.35+00	2023-04-10 11:27:58.35+00
cvN-WbHRv0VrlbVpg0aiPU:APA91bFRQe026aLWOMLPPbLRjmH3G9p2z-W2t-5jAVn-F86UZ13fXs3r9GGYj0S20RZMUGsGnuq603MaxJp5v-pDfEZt95ctidn78qXIdr6078IK8o6gpgGk9CKTuB52J3JvLJimLYQ1	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-08 06:09:43.675+00	2023-04-08 06:09:43.675+00
d17qoLu-zUz3oewxM0m2QJ:APA91bGGjGyt2e5hxWoD3WdZqgjW5ff5hxQ7tVhk0dgFlOycZ02wI5G12Uqls2uRuxd09RgSUZ1jDQ-Ii9zCkCCDL5OC53sAs7fvJf019i8QUaD2xMPDI5Ow7ImwE6iAWQcITfNt3VkW	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-11 04:59:04.887+00	2023-04-11 04:59:04.887+00
eX0f2bsFSdirQkiLbnyDDa:APA91bFJz9bZvcw9s12Oo6z1k1ub14BylZYAWmubRtrL7nmcumPY9PcdSVAWOuFSNUHn0wZOqKKpROhYafi29ijYNjAEJLJaanAPSrTpjvzYuCPNxRdjSGrUU8JOtrzdr8rhyUXZCjSk	2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2	2023-04-11 05:15:51.92+00	2023-04-11 05:15:51.92+00
d62oY0umNEgyhNmVnglsZJ:APA91bFs_g6BKOFbFavZjmImzcxjvOlymHH5Ux9zHpUif_iYxAWLUurV1Woz1uVYE8hsvu9GTEXxo9fqVdqjIxk4zEg6hDC8KlJlxgaLu4rZ0cmawUDstx1JlTsf6sVGMBN9MCIYecfR	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-11 05:51:00.562+00	2023-04-11 05:51:00.562+00
cKjUtRjzX0IkvJDcPeOMMA:APA91bHT_JQMiJEZPMPrrJRmlHz_kWdT8nz2tO1h4PsaiXo7r3JZm85sublWSnkw4SHLFXPqB_0swmTLB24qq7IjyJIpDZRB_w3lkIi5gUFurkVPCdKnv9E3MOCoNJEITWmQBQd876LV	74ca1b0a-82f9-4852-b8da-c1b33181a997	2023-04-11 06:10:20.742+00	2023-04-11 06:10:20.742+00
c1IPxXeot0buue-krH5YP_:APA91bEQ7QFeQ07fMqg_Ib3zaicqmZvFU9ES6ycBXdJzc2QKiZRp8_DfYu169zfwyamxpy1YYwiQXJktwySudfVAaTHIzIvzybLQk_rnpsTJ0shSRkKHHO-sqxaC9500CmY8cTnpTXZd	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-11 06:30:17.586+00	2023-04-11 06:30:17.586+00
e7Hb6anrp0QQsotfTx2iKw:APA91bG44zJy8Yt0_iOifR8wL3jkWlGbredOVwV5VFgUoO7iJE4cyoaIvv_jeEZvc0JzJ88TyiUMBT1sRq_MFtq4qs872WyowC_-wRFZhkExXb_ePNtSxnOvFBLAybHWlTY0trOBZWOj	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-11 07:19:07.361+00	2023-04-11 07:19:07.361+00
eNeS5yk2RuifLJkWZc3TgF:APA91bFisTNKlxU6UBCdO4qFsGsKv58HAsNLJZY8_LYhMaM3FMbe2rSr_A9Zk4HEHdaWqlCBEWg-Gfri_aG8oiIR4UObfZXaNEyQbs9ZBKzYzKeLuAn2f8kdWaLJ1C_GXeUgsJZ95aJy	d0247d36-982d-4d82-b552-c28338bcc67c	2023-04-11 11:06:21.805+00	2023-04-11 11:06:21.805+00
da-c90fyR3Sjggg58H00kH:APA91bGjRctUnBOLlFJCsvTZB1nwZotQv3U3bE16R7BVrg4hIzvLMcqp3PewZp4a2wLh_JwgolzzEBVyWR76U3HuZ_xo6eax3k_VEtGDYm4pidBd9XFai7zANfmABbnLeEcI2nACyCVu	74ca1b0a-82f9-4852-b8da-c1b33181a997	2023-04-11 11:31:55.567+00	2023-04-11 11:31:55.567+00
fDBhBwhG6EszhGiY3eZiLZ:APA91bEIWQ0ioDwjBYRjwJx14FBUTJj_hJX85CToHTZE7jEEenHxok24fhECPXc2VdGOwZ9P9eJb_BWUlhXopIm2i_P3EcywKeQKNlB-irOEmtqhaQW1REKaCoxk7TvJmn95elDetQI6	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-11 11:39:22.666+00	2023-04-11 11:39:22.666+00
fybtmzN_NU4OuGPRSZfXME:APA91bHfNsYa9zOQ28AFOeOlEvitEA9J9iiAEjTlQ1gIkO-fRCj2dq6-LIk_06AKvnk3LGq-VJXSdk9I7RNAsRKBtRHxDDtshaiQR70EWqWUi7mO5dr_Hz-lMNo1bVCI0QWnv7PCvX6E	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-11 13:02:44.551+00	2023-04-11 13:02:44.551+00
dsYFfXQ-nUVZjz_UajqELt:APA91bHd133ebJ_2KxTAH7iD1Lxk6H5oEu_J5d4queUmjkD6Zv7t3yzuCieod7dAjINfyTdC4UW0dL9hAGawctGNQlIecTekCMRML3aZQf6sxPXH7kWZ3Z-08TWPyZp_xANqa2CclvGE	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-12 04:58:16.224+00	2023-04-12 04:58:16.224+00
d_ItMUGwnURfum9BY9QYXT:APA91bGmOJ_KbwhHtAOiKBUyIj_PIsKODFzy8gxf1ZeVtcCh5CbvyQT1YehOKdI0EtLBJOJQOEgom6J2-lhA_8n8lgAE7bH7tiGTbp3AfzD0P63JEv3J_tE081pF7LG89p7VeKH3rrxS	25e7261a-dd11-425c-b01a-5796cf7895c8	2023-04-12 05:27:17.983+00	2023-04-12 05:27:17.983+00
fIeoV9tebEhItnJRRlfBN2:APA91bEh-FyQbrwSrDxXErIr72SVaodFzz6u9v94HeXlFoCQ7CGJ_MY3J8CZWO-hD3XoEdUoeWCQrqKmznwUZx_30XkK8jGrsYDFdZ655Eukj9Z5E2jlQTzA58-lYy0_YGBJYwlVR92K	25e7261a-dd11-425c-b01a-5796cf7895c8	2023-04-12 06:48:07.373+00	2023-04-12 06:48:07.373+00
eqHUZom7S5ysZxHfyMR8bq:APA91bEh0fgUpTgCmm4Rj9HjT27C5gUVCiTzYnEl5BAod3YXO0DXwf1ZmMBbe4PB-moY_I6mpFGPVZFUxJoDw6St8bxwggL7AF57ndFQen-RvO6GbO-o1BmKz4leOepMp2AFrlpfKQRy	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	2023-04-12 09:56:06.013+00	2023-04-12 09:56:06.013+00
ddNEUVM-m0A8s8jUMxabne:APA91bHoC8qxbp1w3CYy4OX8-h6cZoa3Om9N1UDhJX9Jogu-smnpUswsnlBBViYseqkZVz--faOsVviWNjoTWVzdYkx78IC8PZb51XZVxgGgARknHyPgW5nSWREt0J9m_rer3vmaP-iP	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-12 10:14:46.783+00	2023-04-12 10:14:46.783+00
cbzbBn4QP0bdhha_4HWDte:APA91bFN2R7UWXI1UZp66v6DwP4jgVndY4fg19bEVAd80SO4VnXRDoespXjiHHqw9HMGyPZi5-PMdqOMum1kmRIpjkdYMw6aVD1-pqROSUwe1mvfW8GDvMi1oU3IKUkOQr--MTLUmTEU	657975cc-7b3e-49bd-8dc8-76e5cba3293f	2023-04-12 10:14:51.616+00	2023-04-12 10:14:51.616+00
eoBJdbaz601KkTBgZzn91Y:APA91bF2syyaRx7kryAYqxVWsb-SHm7WqbZv7QAhiDEpaChChLHfXgrtptk8naptu7eimjk7bADJzL30gcAKAg2fmfk-PX7cFzmejbQN-fS-N7PWYZ6W7CZiS7B44t1isNNhsMfHJw2R	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-12 10:37:59.721+00	2023-04-12 10:37:59.721+00
cB1mPXwoDEnfkcyvottYYa:APA91bH_Ef1K_gg7EEQizUD9QAqedkQXjrG4OjWfYDARoqX4ZuiH0qFvQmc7qtG5_Ze9KDxSWJddgmgvspwfoxc7a81BD6nIu_hpJAXd-Nw0klAzzCGDYkwufPceARnG6eKRD2lM_Gqo	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-12 10:46:58.295+00	2023-04-12 10:46:58.295+00
dyvtA0E6pkENlCVRZGROGs:APA91bFN04S6OlL25-HEsPOzitUEnW3NRmeLtDBmki0R9f7LdnBfiIougt2aibzy0lu_9h-BvStR_HGWUbD1LnJgiwDC18Q5_ogEeWSeCGQ1fuFw-7FX5i9BXE7E-O2YlwvEHSYn1UCe	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-12 11:08:27.333+00	2023-04-12 11:08:27.333+00
eGrdRuuOTWiAgct62A0CJE:APA91bEWMZjw5l_qa3gB4EdyAmaFLtLbhcgsHtmo9AxprOjOo0JVb0DpDYmBjfROPzqJ3KWPUKNgmGJFf9EIwMK0Ml6tXfIV5iFp_D_FYcZRInzSNaEZU16HSeOzZHek_XLiHMQVGTpt	74ca1b0a-82f9-4852-b8da-c1b33181a997	2023-04-18 13:59:30.489+00	2023-04-18 13:59:30.489+00
e0qwVbspoU0cgYKA7Drpef:APA91bGujyQ-4eHOtplZ470KYq1k72ry-QXRwOJixpLSuDwi1HAp44igWpZDXrrglK0tshI6HfaoyBkDExBmRwEdfgwMccvjCE0tLXuiExYNuc3xDEH5zeXmAYE4xua8VAXWCJvSaNsL	dac88882-c1c5-4855-b0e5-56492ef89f08	2023-04-29 07:57:33.46+00	2023-04-29 07:57:33.46+00
enup483jRxKYWmefjNLpwx:APA91bF430_nr2tIuCYyDfFJAJFd_4SwHYP0UgKGE5hwjQN7ZHVDUsFYWcJdehFIr33dUCv1_6a8j7am-obn6FZaSTvgK1mtPHfjNSshkWjDDH3rWdHxiOUATe4qoJe9xrwOrv9Y0UbP	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-06 16:37:11.698+00	2023-06-06 16:37:11.698+00
eIrQeclhRRuxzkcoN-NAb8:APA91bGQYq_EeN02f7Pi1JIzIf0lQ3lqXCCvWc251o413u_BAL59h5Fnc_35ugPPnpzm7n_4wt9-noT5RY5TzBdvcAGIi0FwdirzK-euRIdokC82zwIhqtKuFUN3j7zNMJWPTgjUP3bg	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	2023-06-06 20:52:19.21+00	2023-06-06 20:52:19.21+00
fQEsATOTQ7efEvbW_P5O7f:APA91bFUbcXJs4LZH0wgeDg4_zIDzxHqTPhIkMZqgSo7bPRRE5NhMvCEad0698SzWgaFd84ZYu1Uu77Tx_3SVB8MxMWeXiGFK-bYQL5U2yY0BlFlVMK39g2XcQ-qipQg2C0pB6BNzk1R	1894fdf1-5eca-438f-8ebb-5078dd18ff01	2023-06-07 09:44:54.172+00	2023-06-07 09:44:54.172+00
eg8za4CVQgma_nSso2g3km:APA91bHl1-s_ZXMbhfrK1a5g83nx_PuLo9rJT1U6MhbTUL-AfJmL9SuPtUmFLCmuje-xxbj3lJMThBRbrHiUQQyrFJ4EOC_V5yGZsRl2dhCtGfcYuoRUvR3FFqkB2UHOrxL04bJ6_g-V	1c950256-e659-4748-ae45-7b73410fdbe9	2024-03-18 19:17:04.868+00	2024-03-18 19:17:04.868+00
cPNhDehdSYGxXKUfVasdLw:APA91bE-hMBgxKT6atU7K5VWq08zcP1phmh4EIxXVFos1bEdZEAUdQ1OIFVFFoP7uywCeZHlbBz0dP-8lRm8QQQuOKCR1OEqfaeCVO1cDu1UZlgef0nkY94-1aJs8aV8PtP7J9Z0XB2q	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-16 14:28:51.138+00	2023-06-16 14:28:51.138+00
eIrQeclhRRuxzkcoN-NAb8:APA91bELT3RFGwT3sL60cmQzHhrKcE_IhgQR8WpquqHqsc06k8B7PYyYdpVqAlQwRImRQWXkNWlTmVLGE6RXQ6ejcZ99uQ2cLnCzwm4-c3GTbw3HaG4zimupyONWSNYm1FwUx4pHwe-6	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-16 14:35:18.189+00	2023-06-16 14:35:18.189+00
e1BYrraHsU04l96oaV5god:APA91bHx-YnmF7C8gQZl_c3Q3sbw6hf-pLKUZzTSkoT28jBEKYUNBh54uEWge_3ljNPUnHhpAC74POUd3uZGDqEmQ-_QOcALg5_ga3b2GNzEcyk0euNrGrmz45Q2n4c-jokqM6QRcZYy	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-23 07:11:14.391+00	2023-06-23 07:11:14.391+00
f8Ylu9zKRkJCvw_TRe5EIc:APA91bHGv_m41vy-fVbpulKdnUrMcvz8vf6bZLlyrEXHSnUoOTvNSp3JotXO5kzSwRFw8Nsmmka6BxQLl0TR77HRNWv7JDeZdMPenhfcqSmV04QP7h-K6rID6AUCwxwZcPeI7EP2Ansl	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-06-23 15:13:04.471+00	2023-06-23 15:13:04.471+00
dGEwmJavUEzptrUsfVY26l:APA91bHckrVXkVfXRv9fO8j8nAAcaDVRxSxZTteWwq_2al1DLL6RuqQYgEuPRCeYJWGL_M2N9EuUzkFm_QKRc377OtoTLtW_QG4eqaEKsS6Soi7nAnT4cwEyrVs0qPZvCWMwhk4SwMEw	473086b3-3778-4b92-ab4c-c11b22421f3c	2023-06-23 21:18:30.904+00	2023-06-23 21:18:30.904+00
ezXs0VRFT7aTgNzjXZLTS9:APA91bEKDhrLBKV7-AjRmxvaqcmq_HnClGHUkeH_MCl1K7Zn7v_Zec1ayGRG7iwQAM1SNj5wu4mZEnI5UQ5KYSsgC1SawlKpFKoUxyUCnaE9Am2NfDpf-kUdCDw4BTf7xJF92gWRlYtF	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-26 02:15:40.94+00	2023-06-26 02:15:40.94+00
faLHljuNY0okvfgkyVk9-a:APA91bFHGWpCJmpOwQvayEnOy6VUBJZ5c5qH5PFE3dpAzVHz-rDFyTCs3X6cKbxAGnbTiUq6VeCgIkO6dB65oggLuM40DvsrCjz_etF9Fjzkf-YwC3Glt4Fv2WwnGhS_V2IvvydX0X17	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-07-01 05:51:20.329+00	2023-07-01 05:51:20.329+00
ere7XwHET2ip0btyvAaT2o:APA91bEOVj4jbpcPD9IREqGeY2Q0BZfNq5zq4bymFZOydHC6i3Sa7iXl7In_0FWf2X5shquverQznek_a9c7QujMxDZb-9sXu89Oiv5NILXWFsrbAoJqlZzcUULZWEBPaH-ZigdIYv_n	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-07-01 07:27:45.062+00	2023-07-01 07:27:45.062+00
fBRJFbuqQjWI9qn8PTnXu9:APA91bEQV0kD3vAOa02lIvmfTjrSladZjG_ZrBd8rIlSfiMBB84CY3w2YXvQi5Bq4wYqzJyslfjQro_gGyYNW9ex5YNx2VgvHYDchajXDxIPVRrF-2uLNcA69zQGqsUjw-3_uJQKJQ2g	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-07-01 07:55:27.775+00	2023-07-01 07:55:27.775+00
fFdfHbInQULvgeTA4ljQog:APA91bG1YMJYTfHavL2ofpjevs7mfVqGsdTn-diEeupTjy-Tzb_3J1_jeFnliSI9MMpKIQY6Dwix8C534cbSuQQFqb2mvWgzNo-3H1tgRSawTTlTDcHqLe_gM6puYfYD5ogeD9qDUFSP	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-09-05 07:01:00.631+00	2023-09-05 07:01:00.631+00
fFqwONdu3EAEg_RE7Ngxml:APA91bFCBtKO2TlZhf_tK82W5NOv8Qwd_PwEqPTA72vXA0rpQRK-iHfI9mC1WzL0AKugrsj3Ay7e6DmOMgICdNMpoNo1epY8niypFLB_jTpW3h9jawk_KIP5f7igZ9iRMBOCNvEtbQRk	10670a64-f419-48aa-b788-63ed4a3798a7	2023-09-11 09:04:16.235+00	2023-09-11 09:04:16.235+00
fD2bgTaIZUo3udxEdN9LuF:APA91bFcrd1ukyLblqIh1n-INBl3WC_0x7HZVDwchda9fEIwEmjPLGOVkQJq15RUDx9AOHWlTMbaNTyzwJfPTOvWUWkWHb0wjYnn55CgajBrUZSMq9GKmDnPGaiz7mEzJZ8m12thMp9r	10670a64-f419-48aa-b788-63ed4a3798a7	2023-09-11 09:20:37.066+00	2023-09-11 09:20:37.066+00
fpO-dToXW0FSotULoaQcZK:APA91bFooE8xlE_oi6w-2cPh5PuXJnH8mUfRWhfLoWCR45YYGS_D6AzQO70tD6d22YAx5hxHFESKqlGHHO_Z-GH9-I3e-yOSvnurgiMT6ZdenwWDpXpen_IcmKbXgg_H9a6ppqbLUHOi	10670a64-f419-48aa-b788-63ed4a3798a7	2023-09-11 09:33:40.043+00	2023-09-11 09:33:40.043+00
eLVH09XtKU8fteplIF2V0n:APA91bGVqiiEGGvJ7zZCPw689ji_89EVWk9Z9rGilJmh9aWPVDAIWnIhfp8gYLtSZcsVXFXl8kgpvpY1HEn3Vr1F2rREEUNmll6tijacwJcRR3em2iIosZCTFKMFepwCqx3bJLkFW4Ca	10670a64-f419-48aa-b788-63ed4a3798a7	2023-09-11 09:40:02.216+00	2023-09-11 09:40:02.216+00
cDkkErLlOUZPpCOju0eVZP:APA91bGW1dYrVUgxoES3gY0qBqTB3IOEQxvUDFt-44leIu-Jkg84vuzAb0ApNBatuWZO8Iqe6tkb2TSQy96q3y-1xIvVNA7vNxyQpdWrgcX8rWLdiD9cYP3GNZMJKg8WMh9i3UyeY5sH	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-09-27 00:06:52.529+00	2023-09-27 00:06:52.529+00
faPq7KGn1khLkAsslr3ARk:APA91bG6OKJWlzQYPK9g-g-edpLpG1BF2CGhXMfiZtNa48qkjoXzDMQWRUvrHU4ur3zPSmuWnoropHL0oSNJTCNsISKHuNSYGVKK9ACShTNOjLDmY3aUntG3QANrs4ttM1i6rJqWCk4w	7505e5d1-50a5-41ff-9ef0-6437444ee7fc	2023-09-29 19:37:21.528+00	2023-09-29 19:37:21.528+00
fDYhItRR-EyRlC1JHHUWBN:APA91bE8ul5alB78Qq3rWClRmPgNkSvc9b18tfXPZr9Rw-tbptaM6yWEKIsP0GYk-kbgvBW6czMeVOiSG9brqXXIx6LIfK7ykp6T9BmlaGUzaQoDjAKh3N3lDTRRjd6UuF4Nji1h_Os4	c1b1395e-c9fa-4de4-b148-07d032e5f763	2023-10-01 14:33:35.88+00	2023-10-01 14:33:35.88+00
fy5CGHM1G0GWpQ4s0WxaCB:APA91bHMop0gU3HRSYQZfW5mN4FOg3h5Xm7-JR477g0TC4me3ad9oYyi8ghbm9q1jJHBahbBO6VrBfHoWJhetzZ7fn9jyYPXh4rXZLiDgRs8jPgNxxhUFyEKevF3yKOUIKrvMDL3D-VQ	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-05 11:24:38.869+00	2023-10-05 11:24:38.869+00
dOBTCzT9_EtfmJ5mJDU-6e:APA91bEuB2VSQTRUTPh7GXZRS0636gIkAIlCPjfoaL_vzZjx7yszw_th_PnWsDu0VZ_XEo-PlV_AQ4UIT8NuRoKE3g7zaWlugUwxv6XW_MIpsm_PINHcO88lBW5fuVgA5HS36bKagFWM	3aaae493-145b-4393-983c-763fc4d06295	2023-10-05 15:30:48.288+00	2023-10-05 15:30:48.288+00
fZ42wTHIcEnjqHTbmA7gEb:APA91bF2Na42nKqfVxacVddswDTRyeVa-nnXQVwJBweep_Dm1DGZhUJvhmu837r6dPT2zsH-k1obRx8NYr9zjkmOTQl-eLK-HBKPowGQ9GPcpSRWhbTrniJJPM-J-qeUbhFqjWyt459P	5110e525-8d24-4aba-ba67-d224aaa03fce	2023-10-06 14:38:17.662+00	2023-10-06 14:38:17.662+00
cDtQb7myqkOnpCV5z0Ezlq:APA91bFnx7QdzEEQp6PrC9zQuNdBkH6jOWG1TxX-WXggao3SdTb1w8ScvNYk0aAaXw7-yyv1hmW7SYapT754mHrm7to3w76U9QAm1vievG3nOCZfPq5QWNZaoax9V-mMH5oXk1ZdjCnO	74e7f5f9-d679-40da-959b-59cf9b8dadb4	2023-10-06 14:44:15.805+00	2023-10-06 14:44:15.805+00
c_7sx50-DUCysYQvQvd6ji:APA91bGMRdnzZpPFj4tg0IWk6dyg_u11Gedd3pN9xBVmn2GySDPGviZUGim6VHiO2O6IFW7CAw5oX1e3cvShfTF-WLt5S6BBWXfYQPM2fHHNqv9QSBHsOybar0s7jEBXW7E_ySRUe5HW	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-10 10:05:17.117+00	2023-10-10 10:05:17.117+00
cK-pj0waUE6si3yZL0giEX:APA91bEeexuqGIT6YEn20cjRBcvR6jww-_7IwUj7ab7FnVDTDY-kUIJ5dtkBl9mLVF50FtPGI8JPn7zI6yAgY7y0z-dM0tA7WosVIB-z8DlnapsQlS9Dgz-obY7s0g56V7zCiWm4wj_R	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-10 10:44:12.594+00	2023-10-10 10:44:12.594+00
eY2I8zxSzkD4pJtmkBG7Hs:APA91bFmOVuV_7_urR3HGxJXFwVxJnFOQ6su-H694zgrwW15y3jbwmO90xDLVgsxPp_C1ed0UQADB6C35O9hqFA07u2sD2b6ZO0ncua0acqcGC-vhFDy_AeoTXSnFRU8upQlyYD3QWX1	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2023-10-11 18:10:25.498+00	2023-10-11 18:10:25.498+00
ciXPm0MuG0DVuFW04Z92Bb:APA91bHysfw16juaNiYLDrFM_4OQVGpgaA8YCR90NqfLNmA4I3GoUQNCB2nwWiWbqxoY9xaH-xLeRFvnau8HYZ2pdJB_X2wqy7JQPlPoDQaYw-7s5kBTD22-b4IgPV-I5T-1fI61zFs4	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-12 05:33:17.279+00	2023-10-12 05:33:17.279+00
fETD4olzScOeW_40Os3nCZ:APA91bHFlqZemMRK7UgHG12IIv86sOwpztx4TktsLIGQnXiP8k9DlGRcc3lFAYuP9oZtO9eMqIsG-0-lKuMEWaAebWKP2Nz_HS-CX2ZA6pd2XbKBrTKz659WcqXnPckUt6XckzcRnqJR	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-12 10:03:11.229+00	2023-10-12 10:03:11.229+00
edU8FPNI3EomkAlkQJB9es:APA91bGd0pCo58v0f3yhaaA3WvnBdbC02jlr4Vf5gW1Z67TvftfR4viGeXXJ-6yB8P7RMO34USv9YjKEe_4LWMAfwO0TUSU4YC_CpK0LaCZ00aK4Z7_OHWNni3BzcUfcRJoTIkft7au_	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-12 11:42:33.411+00	2023-10-12 11:42:33.411+00
cykYbD3g0007jtwI_Fsu4I:APA91bHh1WrRJ8jsmRW8vPzbBAsxwAiXHJ_yeZ_-KUniCfxc9g-wVl4m_neLi3-rqHGhQ4L3OY6hjXC91oph1jVTCjHJHDk5aUjycI-biublGLl10Dv4k7NYzQn_W0vq01pxmFIJYHUp	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2023-10-16 14:29:13.302+00	2023-10-16 14:29:13.302+00
e0MEdznpxkyhu_Z6j_KVyW:APA91bEQt9PKDPXaGj63APk4gJvX4Yv1p2bcJWgKkdJdltA7mAIPTF4PHWzX8XBW_4FU1ybhah914szRe6-jbqGipCOfFShqbUCA7yiRlfBfhLJQ1Iwz2uXQ7D1r9hGpSjwGxkF_pkOC	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2023-10-17 19:13:12.916+00	2023-10-17 19:13:12.916+00
c0Nd3IwRq0oFvh6slLY0um:APA91bFiNTSEYT26cO2U7HrYcQZpPpa8O6rjXEBWlLXvPJcP1NjSr2YRXshWf_SLsuLro-vnLrJft4nBLLu6gUVFBLV3u8UQvR3MpClb-GHAVa9QT7VInz2xCJfWgqIJCNP5nfvCyNjo	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-19 06:05:01.847+00	2023-10-19 06:05:01.847+00
eHqoiZGb5kxCtwH6lM7PXn:APA91bFuc2F6IyaY9EeQcmr6zmHeHZ1j26cJUosRK0T6r-Z1JhzxIQva_WKrUKlIpFagCFxHHCJjbDnRvZLLUneNqQO50SOJ5JTKLfo7BpIh6JBHyKTTEjaAr-X9RamjqN-iIy4VjYjz	b1506c9d-f34b-4591-9a0a-76712b7056d9	2023-10-21 22:43:27.977+00	2023-10-21 22:43:27.977+00
fCvcSPGISV2xr61OQCdUDU:APA91bFDak07ITsyxJssI_0ZNFSlYkqoKJV7xVgppP4SU5ldsCBCOoJrDFUcpcLj2PhkP3loa4_rbEkHtDJplfaButRS7SlW3dlShJMYrBoqPuiFgJ2IdRBCJC_3bzfKADJ8epjARBj2	1c950256-e659-4748-ae45-7b73410fdbe9	2024-03-19 16:57:53.956+00	2024-03-19 16:57:53.956+00
dXXCPkPmsULDjQW38uDC4L:APA91bH1MsHVUmq3CxJHH50QbSBatD48dVQgwZ59P4Ys-_R3mD4Ddg7rEFVpRIDmxLmnxqH41Q2hipbm0Goddsgri3wwwTDmFpf59MRJKhu2lQWbJt60yn0g1Oy3kILru6aMcAZWjNlY	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2023-10-24 14:19:28.276+00	2023-10-24 14:19:28.276+00
cIUKG4Ajck9krvUzVq1lez:APA91bGtCUxeiGQGQnSkGjfg3dwKEvEqpBXY5tKq5fLR69XdMvp-kwgd4jFVG6_ton2JlzmzCewL2QCNjoqkcdg4bIbWZVhBrLMaqQIjoW71CGp3FHkbeCFuxinaIwzmhIIT64PUiIZy	78e8d202-0dcc-48ad-9857-6cc7549b9c6b	2023-10-27 11:55:38.648+00	2023-10-27 11:55:38.648+00
ekZ89HWaFU6MqaR886OLKV:APA91bH52RVLJn-QfmB-T2Xz2nhC1oli_udeO4T7tDs9IcRxFuFT-Wx631WVdEZ_pcPgkyezEHaDUxUh5HzclGpJpmIdqcVA4GEf2qUz4DOzZqSNT7aEVRYOq-eDx3VXU2R1yoM472fe	c1b1395e-c9fa-4de4-b148-07d032e5f763	2023-10-27 12:02:25.362+00	2023-10-27 12:02:25.362+00
cSaWKqOf8kujqw6KIPqsIa:APA91bHYNAnJoBFpw5DIsbFq3eR2V4EQMo78hkm8-ooorrYZZvoSSfEO9Q30JM61lhD8LzKt8pSqvG4qf5dIHI0hH5KJQVwDTMn0olRxJLFnbdpAOxUUm_BMMNBFv9PiHLI449h5JxeN	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2023-10-27 12:15:42.077+00	2023-10-27 12:15:42.077+00
dN9CP0qYP0gEo-qDbtdKtR:APA91bEHpwS0vI0CB49epJdWFnOzxxKzqO27hFVVuHQJRQ-V45XL_2LpYW6vRR8yy7RFUvs9YEikMw5-wEcWAJzAKYA9jcCwah2wrv-OfKO5ed2gwzCbw3mcFkCCED0wgwBr8asctBiQ	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-28 04:28:51.191+00	2023-10-28 04:28:51.191+00
evqOmwqAStKMCYL6GNxQ9l:APA91bH11xgO66mndqo5YnPf4lKJI6TxGV765wXX4-PT1hoXgCMOYsYA11c0AhVHg6xi0ZKh79VB77ucW-58n8AEXKuMKyk0N4qUjqjcRm3-HT0NB9cN-ezA9V4XOI4SwHWI0sqMlVak	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-28 04:40:40.109+00	2023-10-28 04:40:40.109+00
eIIw1D17Z0I1rH4TbosKkf:APA91bGX083tkj4t9d5nOimBMEy5pyoH-PpYLhMhWmXqaMce5zMEAmwmkrmgNNsjcrczQlq9y38I5mPisjOAWINCPPODThm71vcaGE2JtOHzMPgoPrmRdGYycgsou2vdEKBf_RybYJ2i	74e7f5f9-d679-40da-959b-59cf9b8dadb4	2023-11-16 16:25:18.562+00	2023-11-16 16:25:18.562+00
dpq5DYk1hEnqg7Q6lHvHeo:APA91bH_Fzs8idzRG31ZxO2yd1RfTFV_4aKs3CpEMQSp0lE2hWOc7F2KtDS46ig_oOY7phkDKrGh4DzZmei2ex-qMT2wwngKrGLX2PPnXqAK46NPTGqxaNQReJf5wf5aU1WyF2jL_Oku	efefac22-4f55-453d-a6ca-fecd568cf02e	2023-11-16 18:28:43.275+00	2023-11-16 18:28:43.275+00
e3fJbBQm80bTl5iz-2HieA:APA91bH-16FPTq2oHYDvetf2IGQWrzWmnsusL4sFPvgLs0xpK57U13Ow17xcjb9bV5KqKeWh9YRTgooXdU7H0r_RIVhQZoUw4nWHqEPANKqfSKI9wo2ZaoSpSv17z9pUMomIDmcfIKro	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-11-19 19:22:47.076+00	2023-11-19 19:22:47.076+00
ddlKUfUn5kJ8uDnzVvNVUX:APA91bGWlVL3Y88V3Lv2YZDO7yq4IDLRfjKOap4U8MXs8Jx7UU8ksNRrc_Gxp2YoWXNyHYq5ZDtFbw9ggyNxdGEInPm0p8Zu5QWSBezJjeRqhT_VQ7cx7dnEI8Hx5e0fDJhRNC0Xg5KA	7505e5d1-50a5-41ff-9ef0-6437444ee7fc	2023-11-20 22:16:56.424+00	2023-11-20 22:16:56.424+00
eGnLOhmluUOklFrUXSxO3N:APA91bGCsV8ttI8fKc69SzpQ57qDsZC3HDp6NnXazju9ein9lOXLbmmnSJI9QP0Ce34V_HUh4mgOAw4vkQbtQBbS1Q5WFuDynE78C00JSbnpGPduOI9ki2q481c_9z3ZchXcQcGcp5Ha	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-11-21 03:35:55.78+00	2023-11-21 03:35:55.78+00
ea8fZGj-R5aYwsXYNtbRsg:APA91bFFWR-AY4KTsqzhLTNZad4U1qIPamHP9RM-SBH4TVaaASsKgMRuwNJQDQ8NZzzXuhClbTFXbRxsO5nqZEp_MReUSjRB0_m0h78vH28jM97qIzfFICvI47jG7yriFI5Izs4NFtb0	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-11-24 06:13:31.323+00	2023-11-24 06:13:31.323+00
fCnQiI9ySsqrT_GMioRg66:APA91bFP0h19qkkMJb9SQshQGq9-ixfd1-6qO8cIigm3z1SdWqbNPLYuCi-YPcKxTjxP1dLBjwpfFqWd8VluU9QVgdd1NTMMsYjdODAHQKRWsh9neQ0HtaOARpMiDB7bykjBif5JEuoq	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-11-24 06:23:58.231+00	2023-11-24 06:23:58.231+00
f8qEcfPup0UNjZWXIKnhrQ:APA91bEsjLMJ6LONmxBnkaXrxpf0xHD6Yati5mcbhwVlbZyT9_PRxZwGiWaeSbypB6Ece7viqfDK_Z_8wClJWR5DoE8TJG2W4dHXhA3fj-ICu_4V47S1uPMSab45a2d63jVMOCesLVHx	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-11-24 09:50:39.703+00	2023-11-24 09:50:39.703+00
eJmRBd8DCkSYivoc9t-V86:APA91bH2iMRAQO37RsAiAlNX4ic9BKJ_Vf3WV-6I3F63CMUcPOY3jqA4TqJv7Sl4UokwtIs1Z5rreojNFWpY5UfzqHC1hraX8YLCspBMwPiyHwZ_LuLT1uMWaAp1iCDY-VMKwPoiqDNy	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2023-11-24 23:01:36.641+00	2023-11-24 23:01:36.641+00
c1aV6Ep_CEJRgilBCkV8A0:APA91bGXyxzNyzOpD5L310OPZkoeXxQ0AF7387fOdepEj8IrNg129SEMSjSDxXxQTTCfrcHZ2zkwaEuG2koLThQEoZDGjgyClDhH3jO0qn7AQilwt60GziqVxZ1dmQyY15CaT2tBR4dx	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-11-29 05:31:41.68+00	2023-11-29 05:31:41.68+00
dtPiyC3EQb6ZjwtAJ-n31G:APA91bES4hqpi5aojBU__s0iwhnFylBgqAWQLU_XJCk1r5EAPksuDUjDE5Xqg9TI5BBbyIjUU856jOEk3LFDaGqzdD5gNaKupLOzNmU_tjiYrGzjDEqwhyvKF6gPlS0TC25Jly28_9iL	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-11-29 05:54:41.668+00	2023-11-29 05:54:41.668+00
fEBxJvdrQUB5ibC29z9Y2_:APA91bGSnMn0FzcJDtQrf6349D5SSTeDAe2dbW7PYTF8j9uc-xmHNsYZsfEdCbkKTt2rnJn_MVVElZcEyLevDiZ9ienZVXlGWn_xhaEbogFXc9WP53KHhdsZIi9EDvCPxE2Hcf0oB7U9	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-11-29 06:27:56.36+00	2023-11-29 06:27:56.36+00
fe1IGHakhUxToMWtKx_w3r:APA91bFQlz7vKIRediBXDEmEaYIbaVIwVWD1P8qDbn9TCtXtLF-TW47Rb2PnVgHl1-EmRAP-LsBUs17dW2-mEyfFPcOa91TmkEWfJQBMacZ-qaeGUu8iokEyXh1BJiA-pI9Wot3oO0Ov	16225b25-b8b0-4499-9a64-2cf74b39e520	2023-11-29 10:52:27.779+00	2023-11-29 10:52:27.779+00
c9HlQ8INwE7Ps1cC0NkqAt:APA91bEnpcZSBtjcbjvjoeYcS1V1a7snrltFvockWshaxOCgR1dBncXy2_nCZ9yrOS8DadD-m-RgkM3jYscOsStAz8O8z3a3wK1qSjzWe8NkVzzqKkIR_EuuKT-BnicNRsAcyUKoZNRR	39239695-431a-4841-9958-dd95b4106d90	2023-12-26 17:07:49.257+00	2023-12-26 17:07:49.257+00
ca9Xij0n8UnUuws4WhkqP9:APA91bEOf-wc2ZummRcKydB4EcPnl86SfKp4JcYV5_keaMiJGVNAR7wh3svoTqQ7WGItZaKyf8_CWjkv7VSJt4EBwoFRSq_0PVnArLo2rIZqQv3lZSUNfu803IZfkks_MdpSz6TeZFto	bc081193-18aa-49ad-8da0-66a0c46a7eb9	2024-01-01 08:47:17.476+00	2024-01-01 08:47:17.476+00
cKvIDpSrTn2qt7prsfVb33:APA91bEZdqAc_5-QhyBhpTSEuiCQTe1uPTwLExJf8zu3BHZ_X8KAqYSRXuHXfsaJ3OE7a4CuSlCEJWQte_x2EUA1jrt8JXVIKTIaurhdQKWCil8yw7QQl0V3Wa2f7ocLxU1aoPtn0KVc	70aa1373-4ffc-4c85-9cbf-efa49ea37294	2024-01-03 06:00:19.575+00	2024-01-03 06:00:19.575+00
fzAZd_L5rUpPsCpY7DZ-e2:APA91bGJIQJbbhTEI2gFe9ESTrxrjn4GnAwPnrecnqJmMSdmirgQrBlpVVHBXcE5SJc-I-d7ULM-ZfDKRgeR6MUq7RTKtIj9OeO38PBkbJvUXTfIvOuhsOxETVXyQd-iLtrvMcPxCpte	579ce8e1-3110-4035-814e-28e9a13e6ded	2024-01-07 01:10:14.471+00	2024-01-07 01:10:14.471+00
cWhC0fnn3EUMqtIkdUrQ8S:APA91bEbpPii9cF1DKJTUb0JAzJJlN7xH9DzEoIOHNGJ3P1WgKJqVrd6fQzfQlWns57TfQM7SLkPssf5GUzhqv0g_MuESODCvmEI2Jk1ViCi-zBClTi3MbO9bNmKyeBrJoxsA0DyNYYa	390a3e37-8a91-4ae4-987f-f671bd34a650	2024-01-08 03:39:59.575+00	2024-01-08 03:39:59.575+00
dFngoO_W_EwernrvDkEK2m:APA91bE7rogVldnvO2vLDrlquQnR1Fxby3l4eN4tRCF1969h2BnuCSuSvfoXxlHzCzPown_3Z5iq7Htu23LOjDAMHGbgUouJdjL5eeIemzpH8sS1nkS50rkxyigOKbjpKGYog5Q1UNIb	16ed92f3-f879-4699-81b5-e0d8fc6bb890	2024-01-08 03:46:45.113+00	2024-01-08 03:46:45.113+00
cBjiXFtluUc4rRRSRbSAQF:APA91bEaF76j_aYtNJC_Wo__3cCd0DVsBJxKn1jsahO0N5nPcbA2gYQ02mWGKAz4Por8ZRVa4491t8GEqb_qDoclnBEe1PEJGrCB1YJCQCVoFeFS_muu0fAvxgM2PU2ZWmnZbz4X2otT	b710750d-4291-4c7c-b631-5e63d0b664df	2024-01-08 18:05:26.447+00	2024-01-08 18:05:26.447+00
cDk9-TnIZ0LPtQ-KoZ1Ujv:APA91bEhSPDMeEvjCCcCBkdLdSeT47j1Dn8uZjQPI6CSu7kMV5osG4_88q9mEz21FoCE3wjeoKu7u6WhGAzE1THcekl2bSKbekEXWrJMwvjMYG7dAdMacKFIB9h8HiGyRvKuSNZU8tcf	31b62c8f-213d-4e1b-9695-0609c5170cfb	2024-01-09 16:16:43.044+00	2024-01-09 16:16:43.044+00
c-zNF3LAbkwhqYzVIKQ7PL:APA91bFX80N7ZbpeydPIVCndtDQNv-HouZelN0ZLOw6kw0WXdLfRJKfHHpafF1s7ewc3Qs9HrRsbnmxc3rrAfxFTBreFOglIZK2QWQJ22_3ZU_ccx6ClBNe1AZchaMwrinSPLRjA88Tp	b5ad960f-bcbd-4fd5-a8ab-f3e86175cd9a	2024-01-16 00:21:00.59+00	2024-01-16 00:21:00.59+00
f2Zo6V6zIU1Xp62VzCS28M:APA91bGZvi3dQPe94j6PP9f98IdaJt5aI0lxGxTSlHHW5ne8jtUZV3dDWVMfPwhdEsfgdbPPy35AM1niLHuSuYvlVHuuN3eKUAmepa2cyom_l0X3OXLI1qGXdibw3VrWY8lKpPUX87cj	82eeaa00-4577-43eb-8509-f126179b2b56	2024-01-24 01:00:37.323+00	2024-01-24 01:00:37.323+00
dDKmPUYwTOuESIc9iqFDqE:APA91bGH0YILJbk0rmHoHamQb5ZLzuDz8jVnArmBBJRe_ZpGoey4mDMeEb00fVYeYDnzNpGV6NyjE1b-C9IsHGCtNy8ClDjiV8lPUvoFRwZUG1K0c8yxghVri0_rYezTC6DJsJHO2Gqm	e650763e-d8cd-48b8-a978-b12adbf159c4	2024-01-24 01:47:36.237+00	2024-01-24 01:47:36.237+00
eBDZw6zPTfGz28dlxnXTPE:APA91bFgoBFWoDipQXtzZQNZiuFKqtaa5oLtiEgkDS0qDF8UHk7wiQbvhZc_FjmHSCEBk3gc_i-2PqBloeuObCNsGZMIQLt_-CHchovkcY3SanKJ3oy8ttHCaIXdzqd8c2ekyc7nPs0B	8d7aba03-d49d-49e5-9fa8-d05bb4fc99ee	2024-01-30 07:23:15.651+00	2024-01-30 07:23:15.651+00
drWzWgZcQFGMFNljYDkSRx:APA91bEo_f_rk9ndZcejrWxNkZ7oIH9W4yS00IlU9we_nLojvGaCX4yADODBkVok6auXSzlsIQlKozwBoH5PHuY9RVeY_z50xq1I9jUljw26hZTgz4yJ6j27i2TQDZprLWkdn1dJlqBq	40a46846-00c4-4d5b-88d9-f71ef6e078c8	2024-01-30 08:04:48.89+00	2024-01-30 08:04:48.89+00
dU5bYhHmRIWDsmm9ziSoFc:APA91bEgh0JrBUuhSpDBcUcX2zKjHVW9q9akUtghw4fjJ6JdlTdGDIklGnFL07I8A2yGRYp6iKsgQGbwyobpInvzNSVf3aNDxB5JJ6Ev9qIoi22RNy8T0Xb4V4snVcvE5m1Rh5R84HaS	17caaa25-81bd-4379-acc9-13f67e9d6fa7	2024-02-13 08:03:55.913+00	2024-02-13 08:03:55.913+00
f9v2f37i8U81ojl1gQfXx-:APA91bEDKSBLbYpgouCCfakByWCNogH8a4jlcjAZGfRfuErOoxLXSGAuggc4Hq0HF1PdCgNzJr-PIRPyw6TbboWZ9qCy6zVPGZBYJUuVlOikeiD3HPlRbwQa-3uIOyKpawFPHmkF-Igh	17caaa25-81bd-4379-acc9-13f67e9d6fa7	2024-02-26 17:54:29.712+00	2024-02-26 17:54:29.712+00
eGkdUDHXTLqDDXv7Y6Z729:APA91bHP3oqYWKy9ScdRPo-t6UAaqlVwkgQYtJSAYLiflO8gXs1t2kt0VKERhAfKZD3ugp7zYupBmvPchgY28kxwq-GjsPALe2t4aEaxFCAic0-N4ZyJl68VRCJilB1vjq65Kqt5HZkJ	17caaa25-81bd-4379-acc9-13f67e9d6fa7	2024-02-28 13:18:04.474+00	2024-02-28 13:18:04.474+00
fTY-DbigkUwvrpoIBFj10G:APA91bGh-wpBKBFDHFnB5R0A4pg3UXxQIaCGrFM8ca4k_hzGky0DKtwmYMvCawVc7JSh_ZIE8YKkoNP-HHngTdUxdiX7wJpNafMte_A0iVYvDmEYj3tdAoyBCCgdALt0C9F3BLZVUO0w	c1b1395e-c9fa-4de4-b148-07d032e5f763	2024-03-06 17:04:25.394+00	2024-03-06 17:04:25.394+00
ej3YlfuaQSGmajfb0tZnS9:APA91bHsNezWuTIOD0wWAZaOX2VxoVeZEZVLtwQWiKu54Q_2rGHuLt-Ll3bpQKacirtFS7SsFNa2Q-1MRYyoHI8jngnshF1quHZl702lEpJx06ClIdNFD_mruxqPUl7-0I-x2_Zgv3-z	3ff87fa1-3b13-48dd-9984-95ff58d3ed7b	2024-03-06 17:07:29.622+00	2024-03-06 17:07:29.622+00
dF2Xv7xZQRiqjtVv0AuZqD:APA91bGkDeKZaj8oJf19PNrDNPZfJLmA57BuHhK0jsb5xKJpfNld7ICmAae5ZF2lenjt0tPOC3IyI6X5J9xvbCKNufz5Q0nuwBiIvmV-3tRGugsgjQlKdLgWr25HvCpQYhM6t7OZm7ll	c9c1f395-a9f3-4e4d-a7e4-18db8b692aa5	2024-03-06 17:35:13.084+00	2024-03-06 17:35:13.084+00
ftmLcBpORnGv22HYnmVd6M:APA91bGj9XC1p44EpT3-af4SdXTEKRVB33HgiH2sM0ocXByeDmD95Zg6wNKrV8FkO8bfD7v1pJ6P12PDdVfrLbUg8GSVj9ClClkHgdGqIjHJ1n2HmZlk9yj3Y7-aNkS3VfOYkyXtc3WJ	17caaa25-81bd-4379-acc9-13f67e9d6fa7	2024-03-06 19:11:57.29+00	2024-03-06 19:11:57.29+00
dJUUeug8RTOT-dk_fgYU6U:APA91bFPx4LTvJQLUmCyztKM5RJgsAx60wz65-q4APUPHrplsDCFufXUuaBTCeeFEhX2zqDuLcfuZqR5q83HCfHHARDFecptXe-3Dp9PPpP8YRehdTTjLilEbRfN5EP8EGHFhdQwr_YF	17caaa25-81bd-4379-acc9-13f67e9d6fa7	2024-03-06 19:52:53.57+00	2024-03-06 19:52:53.57+00
fA1MmB4fQgKwFeKJIGkrfE:APA91bGIMKvxSoQSLIwQkU-U3C2rFRA61u9bgIZOgNCFkOeCwo0vf6vss9Sc_y_1vpoY7h8pFbQhpXRZxbgoXaCzvo5LMBobrE_nwkjQbFpyUmPyuHp2hSJM5qr1UkyMl_GKjy37SK2K	bbf6c7ba-efb8-47c0-bfaf-bb76cb3d052f	2024-03-07 16:55:17.15+00	2024-03-07 16:55:17.15+00
ectNKnZaSduSvM0-W2UE6n:APA91bEWc-WeIocAJUWVAj_LunwJ_Rorncf6FgZVCu6M732IG1GB9RPX3A8FdoNcPKcPkAlgIGahUVlY83ne7OkiMNE8_uOMwyTfjllaEKtokV7ikdy8eFbOSp-7v9i0VoIG0-kdLzsh	02d196ee-604d-4b60-9baf-5dc28483a43c	2024-03-07 17:39:19.695+00	2024-03-07 17:39:19.695+00
dk63wqzSQF-6OL20t34Mg_:APA91bG6uGNnKktq9reOcH89fcwjgKSjw8_aLUhX_nGPGXbNfOaU96xiT0zt-Fxpt-1_ZqrxgyYysrl9I0GFv5ZQQ2tYAEB_ZzQf7kapdUfcp8W-LmV6BZ0Qs1fmJSXUHhT2vR6QVaZN	b1413a4c-a009-47bf-b99e-1b03dab3ed2a	2024-03-07 17:55:56.002+00	2024-03-07 17:55:56.002+00
eQodMAMcSvqDSJpeSPCaEy:APA91bEppxMddaMSzF32NtaWHxYPMNKTA4brlNlrk5WLG35ihwPG_3hVS4WXesjTz0FXAa8JczDQrEzSjwHOuovAffYSXUDoGW1sl2RffHMhZypsgziQIVSp17-0D5IRaDh5KW2R095w	bbf6c7ba-efb8-47c0-bfaf-bb76cb3d052f	2024-03-11 16:57:49.366+00	2024-03-11 16:57:49.366+00
e_yuTayXT5SNULPO4Ve0Go:APA91bF12A4mCeNWaM7Uq-lNQrBklxA5dz2FtsY6OUCn3hvwa1z4pt_dY8YFYpJeSMY_7ngGZP555VnpGQKTL1XU8DydZqnAi2QxAsEv1nmiRPv52VUXFjbCtcnr2qQASAzu0cU3cFTt	02d196ee-604d-4b60-9baf-5dc28483a43c	2024-03-11 17:18:13.256+00	2024-03-11 17:18:13.256+00
daiKOu7xTX6hF30Zk8M_lZ:APA91bEIvMp3hlN1k_OuAs5_sz5eDBQfWfWLnLI1vPw_gfH8j_byGut0pGMw_ayhM8TikbpofpRYADXqs2KOEL8H4KFJAEiUlONH5Kylhwo_EOmSO0fODyPhpLtVGnRRUf3eVb_IYD6r	e5cd573c-e1d8-471f-99b6-c69260365ea2	2024-03-11 18:05:44.479+00	2024-03-11 18:05:44.479+00
e4WBHEDuOk6zoyuCFcE9Y8:APA91bFhzLMJSuRSeAG5wCp5hyGwjrrs6uozH3AnCffzlTam3eFw2UJCYy6YozIJb7ucVOJQYcTp1d0j6WEIBWr-SrGvLTCdqzIn_7neoOmtbQupcYoUbGrI2AU8eLsBRhtOBm191PU3	1c950256-e659-4748-ae45-7b73410fdbe9	2024-03-18 17:12:08.362+00	2024-03-18 17:12:08.362+00
\.


--
-- Data for Name: footballs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footballs (id, "gameName", "rushingYards", "passingYards", "receivingYards", "kickReturns", sacks, tackles, blocks, catches, interception, "fieldGoals", conversions, touchdowns, "possessionTime", "matchStatus", score, "userId", date, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: gamePractises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."gamePractises" (id, date, "practiseTime", notes, "userId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, title, "playStoreLink", "appStoreLink", "categoryId", thumbnail, "userId", "createdAt", "updatedAt") FROM stdin;
a7d4297b-9c04-4b78-a77f-0f5ff7e83dba	Chess	https://play.google.com/store/apps/details?id=com.chess&hl=en&gl=US	https://apps.apple.com/us/app/chess-play-learn/id329218549	1	1681125117849-442274371.jpg	0d609944-95c2-42ca-8e8e-5f19147f675e	2023-04-10 11:11:57.865+00	2023-04-10 11:11:57.865+00
76052d15-f45b-47d8-88ea-b72094c0fa0e	NEED FOR SPEED	https://play.google.com/store/apps/details?id=com.ea.games.nfs13_row&hl=en&gl=US	https://apps.apple.com/us/app/need-for-speed-most-wanted/id540925164	3	1681125478887-969998140.jpg	0d609944-95c2-42ca-8e8e-5f19147f675e	2023-04-10 11:17:58.945+00	2023-04-10 11:17:58.945+00
c62120e2-ac11-42d4-a314-f5e4b13248f8	Subway Surfers	https://play.google.com/store/apps/details?id=com.kiloo.subwaysurf&hl=en&gl=US	https://apps.apple.com/us/app/subway-surfers/id512939461	4	1681125625453-520273495.jpg	0d609944-95c2-42ca-8e8e-5f19147f675e	2023-04-10 11:20:25.469+00	2023-04-10 11:20:25.469+00
f7b88d0a-4d6d-4562-84d5-d1fd2741d17c	pubg Lite	https://play.google.com/store/apps/details?id=com.tencent.iglite&hl=en&gl=US	https://apps.apple.com/us/app/new-state-mobile/id1542727626	2	1681125306188-740816864.jpg	0d609944-95c2-42ca-8e8e-5f19147f675e	2023-04-10 11:15:06.227+00	2023-04-10 11:15:06.227+00
\.


--
-- Data for Name: getLatestMessages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."getLatestMessages" (id, "userId", "senderId", "messageId", "groupId", "createdAt", "updatedAt") FROM stdin;
cbcfc1f5-6c22-4121-85d5-c01fd9bdfb35	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	79254c3c-4ce5-48b5-8292-26a89ab2e122	3083025e-552c-49ce-a98e-e97cb880f7d4	\N	2023-04-11 09:53:35.146+00	2023-04-11 09:53:35.146+00
ad4b39e5-907e-47d6-94c2-28238b7eedf1	7f5b6fa9-e662-490b-819d-e10fdd790bda	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	519bd67c-9cfb-4552-9c90-e738f8d0ea43	\N	2023-04-12 10:47:24.617+00	2023-04-12 10:47:24.617+00
414f4aed-1dd8-4639-af91-744dbe274aea	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	30f0b5b4-4c61-4c10-9f34-dd047d81000e	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	2023-04-13 05:48:31.551+00	2023-04-13 05:48:31.551+00
0b7274c8-c0ac-47c9-861e-3bfc06da23bd	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	f6b2b18e-e0fa-414f-b875-1e677074283f	2f3464c0-24f9-4449-a6e5-654e02b3c7e3	\N	2023-06-21 15:43:50.47+00	2023-06-21 15:43:50.47+00
0d2401c8-b1d1-4aad-98d6-c45d4332d018	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	d0247d36-982d-4d82-b552-c28338bcc67c	471f2ebc-adf4-4b29-9fb2-4c0cf17fb1de	\N	2023-04-11 10:29:16.263+00	2023-04-11 10:29:16.263+00
c7a27615-842b-40b5-b8d5-2966699a6ddd	79254c3c-4ce5-48b5-8292-26a89ab2e122	456b9492-371f-4b46-b627-92d50651e53b	b930f9db-e62e-44e0-b316-244d77a7f220	\N	2023-04-07 05:18:18.953+00	2023-04-07 05:18:18.953+00
d7d1ccf9-e6f3-47ba-882e-5ba9592e7e46	d0247d36-982d-4d82-b552-c28338bcc67c	74ca1b0a-82f9-4852-b8da-c1b33181a997	4f258ef8-35d4-4bc0-852c-109474c42124	\N	2023-04-11 11:35:45.228+00	2023-04-11 11:35:45.228+00
00174056-0e67-4c4e-b772-c74dd89fced0	\N	25e7261a-dd11-425c-b01a-5796cf7895c8	a6f414ac-58cb-4ef4-9a3b-9310cc2cb281	43f8a619-acb4-40a5-a590-e64bef3dfa97	2023-04-12 09:06:56.138+00	2023-04-12 09:06:56.138+00
472b6241-86a9-477f-a0ca-baa36727430d	\N	74ca1b0a-82f9-4852-b8da-c1b33181a997	4e895d45-b322-4bbe-92c7-40830a192c62	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	2023-04-11 11:38:40.446+00	2023-04-11 11:38:40.446+00
c3a2a0cb-9ce1-4c5f-aea9-aa1f83b341a3	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	bd2de352-bca4-4111-ac4c-2034247f0353	f90b554f-a4e3-43b5-b622-69853a1f73f1	2023-04-11 11:38:43.1+00	2023-04-11 11:38:43.1+00
bec17b04-9880-449e-8794-80b657523299	657975cc-7b3e-49bd-8dc8-76e5cba3293f	7f5b6fa9-e662-490b-819d-e10fdd790bda	1b17cd92-897f-45ea-8321-ba1684604b08	\N	2023-04-12 10:23:56.416+00	2023-04-12 10:23:56.416+00
b38c70f4-e14d-4d6f-8ca0-a9113eec33fd	d0247d36-982d-4d82-b552-c28338bcc67c	7f5b6fa9-e662-490b-819d-e10fdd790bda	9be8d4c5-e676-4fe8-a36b-05048f859b34	\N	2023-06-26 09:39:33.872+00	2023-06-26 09:39:33.872+00
cb017830-addb-4568-9a5d-7dfbb02862c0	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	7f5b6fa9-e662-490b-819d-e10fdd790bda	3d300a43-2ee6-40e8-8abd-e403e24f9803	\N	2023-06-26 11:08:42.141+00	2023-06-26 11:08:42.141+00
69e88fc9-372d-452c-bd25-386ad2d11ffe	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	c5b61b47-e313-47b7-ad0b-d8f0ea0a708c	8570e857-819c-4a1f-831b-72f90a2059ec	2023-08-17 05:50:18.772+00	2023-08-17 05:50:18.772+00
cb64f5ce-2331-42ca-b96d-20aa0506004f	c1b1395e-c9fa-4de4-b148-07d032e5f763	228f909e-70d1-4b69-bae8-6f72cfee94aa	480971f4-b4f3-44ec-acd6-43a3186ee858	\N	2023-09-27 14:20:29.958+00	2023-09-27 14:20:29.958+00
8303a85d-5245-4ceb-b79f-1e2f79ce44f2	a3629d4e-f26f-43cb-9c3e-5461022ff427	9d5a2086-fc35-49ac-ade4-8690a88db24c	99449336-2e0d-467a-a88f-b6886e6c724a	\N	2023-10-11 10:47:00.786+00	2023-10-11 10:47:00.786+00
c268ea44-0695-4ce8-b765-11d7a6f7f1bc	\N	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	95a585ae-b470-4243-9a73-530ced8dfb04	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	2023-10-24 09:47:47.215+00	2023-10-24 09:47:47.215+00
e8dfb70d-77be-4386-a4f5-bbe991dd11a9	\N	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	47101f79-6fbc-491c-b1f7-490651bba9dc	5a0edfdc-a079-4e29-86e0-ac534e81f38b	2023-11-13 14:41:11.522+00	2023-11-13 14:41:11.522+00
1d31752f-114f-4f01-b3f8-05ac4416e46e	\N	3ff87fa1-3b13-48dd-9984-95ff58d3ed7b	421905c9-ca4e-49ad-9f28-c9e853fffd27	327acc88-8f96-4c83-a3c7-6602e7132b0a	2024-03-06 18:42:13.564+00	2024-03-06 18:42:13.564+00
f75a9310-8be9-4792-ac80-c40f9d9fda86	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	89e4887d-7405-4d90-8b23-838e6693b26f	82a7b283-9cda-484b-8de1-11f0db950ff5	2023-10-12 11:44:11.491+00	2023-10-12 11:44:11.491+00
ddc15521-e5da-44f8-a90c-75e84a3c8013	\N	10670a64-f419-48aa-b788-63ed4a3798a7	99daf7a8-8c64-4119-9817-c231a520d925	4d15f55a-fca2-483b-9d5e-03a7bfb13308	2023-10-20 12:52:45.824+00	2023-10-20 12:52:45.824+00
\.


--
-- Data for Name: golfs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.golfs (id, "gameName", "golfHole", "drivingDistance", "drivingAccuracy", "carryingDistance", "FairwaysRegulation", "greensRegulation", "puttsPerRound", handicap, "sandSaves", eagles, birdies, pars, bogeys, "matchStatus", score, "userId", date, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: googleAds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."googleAds" (id, "appOpen", banner, interstitial, "nativeAdvanced", rewarded, "isAndroid", status, "createdAt", "updatedAt") FROM stdin;
2	ca-app-pub-7867769523394832/4748804038	ca-app-pub-7867769523394832/3004477524	ca-app-pub-7867769523394832/5191657161	ca-app-pub-7867769523394832/4570826160	ca-app-pub-7867769523394832/9377822913	t	t	2023-04-14 12:09:32.414+00	2023-08-15 06:35:16.143+00
1	ca-app-pub-7867769523394832/7490026176	ca-app-pub-7867769523394832/7313916299	ca-app-pub-7867769523394832/9924617825	ca-app-pub-7867769523394832/6659310171	ca-app-pub-7867769523394832/5098816493	f	t	2023-04-14 12:08:20.133+00	2023-09-06 11:30:51.723+00
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name, "creatorId", "userList", "profileImage", "createdAt", "updatedAt") FROM stdin;
f90b554f-a4e3-43b5-b622-69853a1f73f1	group for discussion 	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","b80adaef-78ae-4135-96d2-12ec481c758e":"b80adaef-78ae-4135-96d2-12ec481c758e","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518"}	\N	2023-04-05 06:26:25.61+00	2023-04-05 06:26:25.61+00
6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	iyuhgfvhjk	79254c3c-4ce5-48b5-8292-26a89ab2e122	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","b80adaef-78ae-4135-96d2-12ec481c758e":"b80adaef-78ae-4135-96d2-12ec481c758e","79254c3c-4ce5-48b5-8292-26a89ab2e122":"79254c3c-4ce5-48b5-8292-26a89ab2e122"}	\N	2023-04-07 06:25:42.543+00	2023-04-07 06:25:42.543+00
e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	basketball ball child parents	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997"}	\N	2023-04-11 10:05:18.486+00	2023-04-11 11:38:03.446+00
43f8a619-acb4-40a5-a590-e64bef3dfa97	golf group	25e7261a-dd11-425c-b01a-5796cf7895c8	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","9688397f-6b0a-4857-ba38-78d48f536ba3":"9688397f-6b0a-4857-ba38-78d48f536ba3","dac88882-c1c5-4855-b0e5-56492ef89f08":"dac88882-c1c5-4855-b0e5-56492ef89f08","ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9","25e7261a-dd11-425c-b01a-5796cf7895c8":"25e7261a-dd11-425c-b01a-5796cf7895c8"}	1681288758238-242140176.jpg	2023-04-12 08:39:18.248+00	2023-04-12 08:39:18.248+00
8570e857-819c-4a1f-831b-72f90a2059ec	test	9d5a2086-fc35-49ac-ade4-8690a88db24c	{"929842c0-64eb-4369-96d1-306c4daf8f9d":"929842c0-64eb-4369-96d1-306c4daf8f9d","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","48bb84ff-714f-4e7e-8172-359adfb1f13e":"48bb84ff-714f-4e7e-8172-359adfb1f13e","9d5a2086-fc35-49ac-ade4-8690a88db24c":"9d5a2086-fc35-49ac-ade4-8690a88db24c"}	\N	2023-08-17 05:41:33.007+00	2023-08-17 05:41:33.007+00
2b052cc9-78bb-4fe3-86d0-0ce805f4f563	New Parent Group	9d5a2086-fc35-49ac-ade4-8690a88db24c	{"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9","576a1e23-df24-452d-ba2a-b06c7a6a8f4c":"576a1e23-df24-452d-ba2a-b06c7a6a8f4c","2b6aa620-df6c-43a6-92c6-1e4b3de4706b":"2b6aa620-df6c-43a6-92c6-1e4b3de4706b","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","9d5a2086-fc35-49ac-ade4-8690a88db24c":"9d5a2086-fc35-49ac-ade4-8690a88db24c"}	\N	2023-08-17 06:46:08.385+00	2023-08-17 06:46:08.385+00
12fa232c-7bd4-4d83-a283-a0f1489e5185	New Test	9d5a2086-fc35-49ac-ade4-8690a88db24c	{"d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","2b6aa620-df6c-43a6-92c6-1e4b3de4706b":"2b6aa620-df6c-43a6-92c6-1e4b3de4706b","b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9","9d5a2086-fc35-49ac-ade4-8690a88db24c":"9d5a2086-fc35-49ac-ade4-8690a88db24c"}	1697803017367-871738173.jpg	2023-08-17 06:44:14.628+00	2023-10-20 11:56:57.389+00
d94a2450-45ca-4b8f-9a15-b6d221baada5	Todat Test	9d5a2086-fc35-49ac-ade4-8690a88db24c	{"2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2":"2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2","8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","9d5a2086-fc35-49ac-ade4-8690a88db24c":"9d5a2086-fc35-49ac-ade4-8690a88db24c"}	\N	2023-09-02 06:11:02.934+00	2023-09-02 06:11:02.934+00
82a7b283-9cda-484b-8de1-11f0db950ff5	ok	9d5a2086-fc35-49ac-ade4-8690a88db24c	{"f6b2b18e-e0fa-414f-b875-1e677074283f":"f6b2b18e-e0fa-414f-b875-1e677074283f","2b6aa620-df6c-43a6-92c6-1e4b3de4706b":"2b6aa620-df6c-43a6-92c6-1e4b3de4706b","25e7261a-dd11-425c-b01a-5796cf7895c8":"25e7261a-dd11-425c-b01a-5796cf7895c8","579ce8e1-3110-4035-814e-28e9a13e6ded":"579ce8e1-3110-4035-814e-28e9a13e6ded","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","d8dbc425-be21-4f3a-beab-a37e6397e24f":"d8dbc425-be21-4f3a-beab-a37e6397e24f","48bb84ff-714f-4e7e-8172-359adfb1f13e":"48bb84ff-714f-4e7e-8172-359adfb1f13e","9688397f-6b0a-4857-ba38-78d48f536ba3":"9688397f-6b0a-4857-ba38-78d48f536ba3","dac88882-c1c5-4855-b0e5-56492ef89f08":"dac88882-c1c5-4855-b0e5-56492ef89f08","9d5a2086-fc35-49ac-ade4-8690a88db24c":"9d5a2086-fc35-49ac-ade4-8690a88db24c"}	\N	2023-09-02 06:18:11.134+00	2023-09-02 06:18:11.134+00
5a0edfdc-a079-4e29-86e0-ac534e81f38b	Goats 	c1b1395e-c9fa-4de4-b148-07d032e5f763	{"579ce8e1-3110-4035-814e-28e9a13e6ded":"579ce8e1-3110-4035-814e-28e9a13e6ded","68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3","c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	\N	2023-09-27 14:14:26.796+00	2023-09-27 14:14:26.796+00
4d15f55a-fca2-483b-9d5e-03a7bfb13308	data	10670a64-f419-48aa-b788-63ed4a3798a7	{"9688397f-6b0a-4857-ba38-78d48f536ba3":"9688397f-6b0a-4857-ba38-78d48f536ba3","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","10670a64-f419-48aa-b788-63ed4a3798a7":"10670a64-f419-48aa-b788-63ed4a3798a7"}	1697806386764-257763102.jpg	2023-08-03 09:40:36.632+00	2023-10-20 12:53:06.795+00
a42e4019-860a-452c-a065-1984bc132579	reds	c1b1395e-c9fa-4de4-b148-07d032e5f763	{"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3","579ce8e1-3110-4035-814e-28e9a13e6ded":"579ce8e1-3110-4035-814e-28e9a13e6ded","c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	\N	2023-10-24 14:17:02.55+00	2023-10-24 14:17:02.55+00
898100a9-d3b5-470d-acf5-8f5ad9b260d0	Hype 1 	c1b1395e-c9fa-4de4-b148-07d032e5f763	{"82eeaa00-4577-43eb-8509-f126179b2b56":"82eeaa00-4577-43eb-8509-f126179b2b56","e650763e-d8cd-48b8-a978-b12adbf159c4":"e650763e-d8cd-48b8-a978-b12adbf159c4","c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	\N	2024-01-24 01:25:04.009+00	2024-01-24 01:25:04.009+00
327acc88-8f96-4c83-a3c7-6602e7132b0a	group 1	17caaa25-81bd-4379-acc9-13f67e9d6fa7	{"3ff87fa1-3b13-48dd-9984-95ff58d3ed7b":"3ff87fa1-3b13-48dd-9984-95ff58d3ed7b","c9c1f395-a9f3-4e4d-a7e4-18db8b692aa5":"c9c1f395-a9f3-4e4d-a7e4-18db8b692aa5","17caaa25-81bd-4379-acc9-13f67e9d6fa7":"17caaa25-81bd-4379-acc9-13f67e9d6fa7"}	\N	2024-03-06 18:39:58.966+00	2024-03-06 18:39:58.966+00
\.


--
-- Data for Name: hockeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hockeys (id, "gameName", goals, "penaltyMinutes", "timeOnIce", plus, minus, "faceOffPerc", assists, "emptyNetGoals", "overtimeLoss", "winningGoals", "otGoals", "playGoal", points, "shotsOnGoals", "shortHandedGoals", shutout, saves, "matchStatus", score, "userId", date, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: lacrosses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lacrosses (id, "gameName", goals, "minutesPlayed", "groundBalls", "causedTurnover", "blockedShot", "shotsOnGoals", "handedGoal", clear, "turnOver", "faceOffsWon", "faceOffsLoss", "penaltyMinutes", fouls, "gameWinningGoals", saves, shutouts, "goalsAllowed", "matchStatus", assists, score, "userId", date, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: matchVideos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."matchVideos" (id, "videoId", "thumbnailId", title, "creatorId", "teamId", date, "createdAt", "updatedAt") FROM stdin;
a7464124-20eb-48c1-a4a0-e3aff4ad9344	1680581748456-446508908.mp4	1680581748456-446508908.png	morning 	456b9492-371f-4b46-b627-92d50651e53b	6fe73af9-eec2-4e94-b23b-3498e11f0de2	2023-04-04	2023-04-04 04:15:49.098+00	2023-04-04 04:15:49.098+00
15d16697-08bd-4716-959f-777d987cc499	1680686187021-292135255.mp4	1680686187021-292135255.png	The first time 	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	6f329eeb-b98c-4599-9855-b048812c8721	2023-04-05	2023-04-05 09:16:27.539+00	2023-04-05 09:16:27.539+00
915f143d-30fe-487a-bf5f-e17a689e45e7	1681115460804-87674620.mp4	1681115460804-87674620.png	The first time 	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	6f329eeb-b98c-4599-9855-b048812c8721	2023-04-10	2023-04-10 08:31:01.301+00	2023-04-10 08:31:01.301+00
a00ce54f-0389-43e6-a834-d35dca2ead7c	1681118113290-193364171.mp4	1681118113290-193364171.png	hello hi 	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	6f329eeb-b98c-4599-9855-b048812c8721	2023-04-10	2023-04-10 09:15:13.586+00	2023-04-10 09:15:13.586+00
b5e5fb02-b494-458e-91b5-40757d700008	1681124379750-849708840.mp4	1681124379750-849708840.png	hotstar special 	7d812252-ad98-434a-98af-ba059971b67f	79859e57-421b-46d0-816e-eb3f5bfb2558	2023-04-10	2023-04-10 10:59:40.275+00	2023-04-10 10:59:40.275+00
\.


--
-- Data for Name: merchandises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchandises (id, name, description, thumbnail, media, "basePrice", "discountPercentage", "discountedPrice", quantity, "avlQuantity", "categoryId", "hasSizeAvailable", s, m, l, xl, xxl, status, "isDeleted", "createdAt", "updatedAt") FROM stdin;
0e8799fa-0552-427f-b299-2156fd7b0334	Lego Toys	This is good quality lego Toys for chiledrens.	1681212756666-802638444.jpg	{"1681212756694-522274990.jpg":"1681212756694-522274990.jpg","1681212756702-57710442.jpg":"1681212756702-57710442.jpg","1681212756715-817998451.jpg":"1681212756715-817998451.jpg","1681212756782-210836043.jpg":"1681212756782-210836043.jpg","1681212756846-681729342.jpg":"1681212756846-681729342.jpg"}	10	12	9	10	5	3	f	0	0	0	0	0	t	t	2023-04-11 11:32:36.858+00	2023-08-29 17:42:38.739+00
1d5a69ac-0b09-4163-8e41-47d392b65a44	cap	This is Good Cap for summer.	1681212400362-360043803.jpg	{"1681212400367-842778302.jpg":"1681212400367-842778302.jpg","1681212400388-362552624.jpg":"1681212400388-362552624.jpg","1681212400393-18664785.jpg":"1681212400393-18664785.jpg","1681212400399-934998478.jpg":"1681212400399-934998478.jpg","1681212400402-517186813.jpg":"1681212400402-517186813.jpg","1681212400407-181485447.jpg":"1681212400407-181485447.jpg"}	5	20	4	50	48	2	f	0	0	0	0	0	t	f	2023-04-11 11:26:40.46+00	2023-10-20 12:08:06.455+00
d4069b99-398a-42d3-90a7-8018e9e67f6e	White shirt	this is good shirt with all side rounded corner	1681130149660-1196405.jpg	{"1681130149684-675199041.jpg":"1681130149684-675199041.jpg","1681130149701-845113093.jpg":"1681130149701-845113093.jpg","1681130149703-877474377.jpg":"1681130149703-877474377.jpg","1681130149711-330553582.jpg":"1681130149711-330553582.jpg"}	10	11	9	50	45	1	t	2	1	0	0	22	f	f	2023-04-10 12:35:49.813+00	2023-09-06 18:08:33.12+00
d49765ba-1f60-4088-9f88-99fdfe0469df	White Mug	This is Good Quality mug for Tea and coffee.	1681213049667-315062884.jpg	{"1681213049678-623011612.jpg":"1681213049678-623011612.jpg","1681213049698-12862897.jpg":"1681213049698-12862897.jpg","1681213049700-528806222.jpg":"1681213049700-528806222.jpg","1681213049703-672454614.jpg":"1681213049703-672454614.jpg"}	5	0	5	50	43	4	f	0	0	0	0	0	t	f	2023-04-11 11:37:29.815+00	2023-10-19 06:28:00.297+00
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, "userId", "senderId", "groupId", message, "hasRead", "hasReads", "createdAt", "updatedAt") FROM stdin;
3083025e-552c-49ce-a98e-e97cb880f7d4	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hy	t	{}	2023-04-11 09:53:35.135+00	2023-04-11 09:53:38.294+00
7557b8ce-9592-47ba-a0c4-0d298838c2cc	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518"}	2023-04-11 10:12:12.178+00	2023-04-11 10:54:54.683+00
6189f02b-3b9d-4717-9aea-8be950b2e824	d0247d36-982d-4d82-b552-c28338bcc67c	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hyyy	t	{}	2023-04-11 10:49:40.95+00	2023-04-11 10:49:52.565+00
2f3464c0-24f9-4449-a6e5-654e02b3c7e3	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	f6b2b18e-e0fa-414f-b875-1e677074283f	\N	bro	t	{}	2023-06-21 15:43:50.455+00	2023-06-22 12:49:12.72+00
e67722dd-1888-4f87-9fcd-84d6eadbec01	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	f6b2b18e-e0fa-414f-b875-1e677074283f	\N	test	t	{}	2023-06-21 15:43:36.906+00	2023-06-22 12:49:13.19+00
9cc40160-b145-45d8-b18e-91a83f88bc2b	d0247d36-982d-4d82-b552-c28338bcc67c	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	\N	hyyyy	t	{}	2023-04-11 10:26:45.845+00	2023-04-11 10:29:16.312+00
431b1127-f8e2-4365-84b0-15a65261aced	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	The 	t	{}	2023-04-11 10:32:08.533+00	2023-04-11 10:32:14.1+00
781de013-4bdc-4d9f-a49b-931c0ac57e63	7f5b6fa9-e662-490b-819d-e10fdd790bda	d0247d36-982d-4d82-b552-c28338bcc67c	\N	hy	t	{}	2023-04-11 10:10:04.132+00	2023-04-11 10:10:27.708+00
6bf80d64-63dd-48f8-a037-a035fe6febdb	d0247d36-982d-4d82-b552-c28338bcc67c	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hy	t	{}	2023-04-11 10:10:11.349+00	2023-04-11 10:10:32.607+00
0a3858d1-91ee-4b82-9885-02885c9e20ee	d0247d36-982d-4d82-b552-c28338bcc67c	74ca1b0a-82f9-4852-b8da-c1b33181a997	\N	hy	t	{}	2023-04-11 11:34:38.491+00	2023-04-11 11:34:42.226+00
70db1637-466e-4101-b915-70b48ca58272	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hello everyone 	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-05 06:27:14.46+00	2023-04-05 07:11:50.783+00
b83ebac2-d75b-4303-a482-c395ade50893	\N	25e7261a-dd11-425c-b01a-5796cf7895c8	43f8a619-acb4-40a5-a590-e64bef3dfa97	hello 	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9"}	2023-04-12 08:54:14.753+00	2023-04-17 04:08:42.681+00
6439c74c-67db-4db1-b3ea-44ef32d99de8	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-05 06:26:47.837+00	2023-04-05 07:11:50.842+00
80f29df0-3013-41c8-aef3-8b4437a62e1c	74ca1b0a-82f9-4852-b8da-c1b33181a997	d0247d36-982d-4d82-b552-c28338bcc67c	\N	hy	t	{}	2023-04-11 11:34:28.822+00	2023-04-11 11:35:46.14+00
75db7f90-840d-48f5-a4c5-6081b1a77076	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-05 06:39:46.194+00	2023-04-05 07:34:14.904+00
d06a2b1a-fcc3-46ba-b8be-8b7879c08ac1	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hello 	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-05 07:33:08.91+00	2023-04-05 08:51:33.141+00
05b6c132-cf64-4116-b07e-eb70f395b485	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-05 06:40:09.112+00	2023-04-05 08:51:33.82+00
f80da498-4e1b-4367-aec9-7c22aa530bb8	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	xfnzgnxgnxmgxgmxgmgmxmhxgmxgmxgmxgmxgmx	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-05 07:34:03.751+00	2023-04-05 08:51:33.145+00
1e431ad0-16d5-43b1-bd48-29f7d3cdcc08	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	f6b2b18e-e0fa-414f-b875-1e677074283f	\N	hey	t	{}	2023-06-21 15:43:45.687+00	2023-06-22 12:49:13.2+00
cb1b4bc5-0b84-4494-a109-4e41fcf8d556	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-05 07:39:30.937+00	2023-04-05 08:53:35.796+00
d97889e4-ecc3-4e9b-b749-de33bb2243df	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-05 07:31:41.787+00	2023-04-05 08:51:33.101+00
66623ff9-7aa1-47d8-8273-65d27babedf7	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hfjggjdgjxnxgxgxgnxgm	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-05 07:34:48.434+00	2023-04-05 08:51:33.83+00
058b7830-b141-4458-910b-7a543dc23a91	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	tinggnznmgzfnzgn	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-05 07:35:01.37+00	2023-04-05 08:52:56.844+00
3a9d85a6-6cab-4004-98ed-e9aa92fcf79f	d0247d36-982d-4d82-b552-c28338bcc67c	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hy	t	{}	2023-04-11 10:10:27.1+00	2023-04-11 10:10:31.935+00
ff5459f0-aa97-4aa3-ab9b-1abfe20cc85c	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hy	t	{}	2023-04-11 10:32:25.581+00	2023-04-11 10:32:37.652+00
e2ee1426-8d60-4892-849c-347f38ad9f28	7f5b6fa9-e662-490b-819d-e10fdd790bda	d0247d36-982d-4d82-b552-c28338bcc67c	\N	hello dear how to make 	t	{}	2023-04-11 10:49:51.983+00	2023-04-11 10:49:53.314+00
ec2a797f-971f-4fdd-af89-9cc3e532bbc1	\N	7f5b6fa9-e662-490b-819d-e10fdd790bda	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy guys 	f	{"1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c"}	2023-04-11 10:10:46.061+00	2023-04-11 10:12:25.391+00
fdd1c480-2feb-4068-abce-89ec6ae3c9e4	\N	d0247d36-982d-4d82-b552-c28338bcc67c	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hu	f	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518"}	2023-04-11 10:12:18.125+00	2023-04-11 11:36:25.294+00
77734d82-7295-4700-a750-c9696560a965	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hello good morning 	f	{"d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518"}	2023-04-11 10:08:57.385+00	2023-04-11 10:11:18.647+00
16964182-b705-47dd-b8e7-20543c027675	d0247d36-982d-4d82-b552-c28338bcc67c	74ca1b0a-82f9-4852-b8da-c1b33181a997	\N	hy	t	{}	2023-04-11 11:35:06.996+00	2023-04-11 11:35:21.646+00
c8016923-c21f-4f10-ad64-7a0f68d4563f	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hy	t	{}	2023-04-11 10:29:01.75+00	2023-04-11 10:29:05.267+00
ef5f5c0d-7519-4a8b-aba5-b7af3db842dc	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hello 	f	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997"}	2023-04-11 10:12:30.242+00	2023-04-11 11:38:14.312+00
f632cece-8256-47d7-86b0-f42c4e90c519	\N	25e7261a-dd11-425c-b01a-5796cf7895c8	43f8a619-acb4-40a5-a590-e64bef3dfa97	hy	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9"}	2023-04-12 08:54:40.333+00	2023-04-17 04:08:42.019+00
34eba461-9209-4c24-9c4f-65ddab3a51ba	7f5b6fa9-e662-490b-819d-e10fdd790bda	657975cc-7b3e-49bd-8dc8-76e5cba3293f	\N	the 	t	{}	2023-04-12 10:23:37.854+00	2023-04-12 10:23:46.004+00
8a455ba3-d54c-4d59-bcd8-7345f72c3eec	7f5b6fa9-e662-490b-819d-e10fdd790bda	657975cc-7b3e-49bd-8dc8-76e5cba3293f	\N	hy	t	{}	2023-04-12 10:23:21.674+00	2023-04-12 10:23:46.683+00
0c5c2fbb-7fb6-463c-bf4a-a3ad016da9c0	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hello weyewyd 	f	{"d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	2023-04-11 11:36:39.5+00	2023-06-26 11:09:00.069+00
30c7a199-2fbb-44ba-b8c3-c277b8f9398d	\N	d0247d36-982d-4d82-b552-c28338bcc67c	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hello 	f	{"1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	2023-04-11 11:36:20.234+00	2023-06-26 11:08:59.254+00
7e29159a-08a5-49c0-b3a6-15291989efbd	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	y	f	{"d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	2023-04-11 11:37:03.738+00	2023-06-26 11:09:00.993+00
34ef7d15-46a8-4993-8c90-dfd7c9ca6bd4	\N	17caaa25-81bd-4379-acc9-13f67e9d6fa7	327acc88-8f96-4c83-a3c7-6602e7132b0a	hallo sami	f	{"3ff87fa1-3b13-48dd-9984-95ff58d3ed7b":"3ff87fa1-3b13-48dd-9984-95ff58d3ed7b"}	2024-03-06 18:40:28.027+00	2024-03-06 18:42:15.351+00
a6f414ac-58cb-4ef4-9a3b-9310cc2cb281	\N	25e7261a-dd11-425c-b01a-5796cf7895c8	43f8a619-acb4-40a5-a590-e64bef3dfa97	hell	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-12 09:06:56.131+00	2023-04-17 04:08:42.69+00
947a9e92-300f-48aa-8de1-b9eff3c9ce08	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hy	t	{}	2023-04-07 05:11:36.04+00	2023-04-07 05:11:38.913+00
6aa91497-927c-4089-baf9-bea229952397	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hy	t	{}	2023-04-07 05:11:41.607+00	2023-04-07 05:11:44.403+00
491d20c0-ea76-48d5-ac17-379f89bd4c0c	7f5b6fa9-e662-490b-819d-e10fdd790bda	657975cc-7b3e-49bd-8dc8-76e5cba3293f	\N	hy	t	{}	2023-04-12 10:21:08.13+00	2023-04-12 10:21:20.395+00
1b17cd92-897f-45ea-8321-ba1684604b08	657975cc-7b3e-49bd-8dc8-76e5cba3293f	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hello 	t	{}	2023-04-12 10:23:56.41+00	2023-04-12 10:23:57.057+00
3ebce9bb-1fb0-46f3-9301-808e0b4c6b93	7f5b6fa9-e662-490b-819d-e10fdd790bda	657975cc-7b3e-49bd-8dc8-76e5cba3293f	\N	hy	t	{}	2023-04-12 10:23:48.975+00	2023-04-12 10:23:57.065+00
648a84a9-1f00-49e4-b61f-a9d42b6d2c32	7f5b6fa9-e662-490b-819d-e10fdd790bda	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	\N	hy	t	{}	2023-04-12 10:47:14.422+00	2023-04-12 10:47:17.133+00
44e99c11-f36d-4597-8000-d0aa4d4b8f5e	f6b2b18e-e0fa-414f-b875-1e677074283f	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	\N	Hello, how did your training went?	t	{}	2023-06-06 16:29:25.704+00	2023-06-06 16:37:48.721+00
4fef201f-85d0-40d1-b7de-e57ccd9fe1bf	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	f6b2b18e-e0fa-414f-b875-1e677074283f	\N	Test notification sounds 	t	{}	2023-06-06 16:49:56.02+00	2023-06-06 16:50:50.85+00
95e82c2e-85a5-49dd-93e6-8ec5f99d46c3	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hyyyyyyy	t	{}	2023-04-07 05:12:17.215+00	2023-04-07 05:12:22.11+00
4b6a31c5-f885-4c89-a01b-59f122e19112	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hype 	t	{}	2023-04-07 05:11:50.052+00	2023-04-07 05:12:22.823+00
f87c07ae-7baa-4053-a5d2-880f4e7f0196	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hyyyyy	t	{}	2023-04-07 05:12:05.844+00	2023-04-07 05:12:22.84+00
130ee690-24fa-4d3d-8ed1-397208c371bf	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hy	t	{}	2023-04-07 05:12:30.216+00	2023-04-07 05:12:54.83+00
058165e4-6221-4e4c-822c-ec8abcebe7e3	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	I’m 	t	{}	2023-04-07 05:12:47.212+00	2023-04-07 05:12:54.84+00
1f9d8ff9-4119-4b3c-add4-bae970f07fa9	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hyyyy	t	{}	2023-04-07 05:12:36.818+00	2023-04-07 05:12:54.854+00
96e81dfe-b51f-4720-a139-da30eeacb94b	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	he	t	{}	2023-04-07 05:12:45.746+00	2023-04-07 05:12:54.858+00
4cead188-f418-4287-bfc1-2abad0bacd1d	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	ufxhflzfjxj c	t	{}	2023-04-07 05:16:07.911+00	2023-04-07 05:16:11.141+00
c77da7a3-13e8-4392-982e-20d3c7145149	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hey 	t	{}	2023-04-07 05:15:57.206+00	2023-04-07 05:16:11.732+00
42995a12-70e8-41fe-a22c-2f909df7bfbe	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	jgxgxckcc c	t	{}	2023-04-07 05:16:16.539+00	2023-04-07 05:18:19.77+00
7ed72f9d-262b-46d4-a825-b9d07afc710e	456b9492-371f-4b46-b627-92d50651e53b	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hdlFhzjf	t	{}	2023-04-07 05:16:22.624+00	2023-04-07 05:18:19.783+00
b30b8b5a-a7ad-464e-996c-e870425c46a3	79254c3c-4ce5-48b5-8292-26a89ab2e122	456b9492-371f-4b46-b627-92d50651e53b	\N	hyyyy	t	{}	2023-04-07 05:18:11.028+00	2023-04-07 05:42:32.614+00
b930f9db-e62e-44e0-b316-244d77a7f220	79254c3c-4ce5-48b5-8292-26a89ab2e122	456b9492-371f-4b46-b627-92d50651e53b	\N	hy	t	{}	2023-04-07 05:18:18.946+00	2023-04-07 05:42:32.616+00
8ae4a21b-332b-486c-8b19-efcb79cf299e	79254c3c-4ce5-48b5-8292-26a89ab2e122	456b9492-371f-4b46-b627-92d50651e53b	\N	hy	t	{}	2023-04-07 05:17:54.911+00	2023-04-07 05:42:33.18+00
10a2abfa-0206-4e21-b0a3-a60f6f647d92	79254c3c-4ce5-48b5-8292-26a89ab2e122	456b9492-371f-4b46-b627-92d50651e53b	\N	hyyyy	t	{}	2023-04-07 05:18:03.095+00	2023-04-07 05:42:33.189+00
60796166-f985-4b2d-b24d-860decd0c63b	\N	7f5b6fa9-e662-490b-819d-e10fdd790bda	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c"}	2023-04-11 10:11:03.047+00	2023-04-11 10:12:25.396+00
e6362e46-fac9-495a-8fb2-750ca15762bf	\N	25e7261a-dd11-425c-b01a-5796cf7895c8	43f8a619-acb4-40a5-a590-e64bef3dfa97	hy	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9"}	2023-04-12 08:54:49.5+00	2023-04-17 04:08:42.058+00
a0840dfc-1b49-4ed6-ad73-745a4b81575d	\N	7f5b6fa9-e662-490b-819d-e10fdd790bda	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	the only 	f	{"1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997"}	2023-04-11 10:50:09.487+00	2023-04-11 11:38:24.946+00
758c273d-8bae-4659-b4b3-15ca4db8dab0	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hy	t	{}	2023-04-11 10:32:42.991+00	2023-04-11 10:32:46.219+00
471f2ebc-adf4-4b29-9fb2-4c0cf17fb1de	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	d0247d36-982d-4d82-b552-c28338bcc67c	\N	hy	t	{}	2023-04-11 10:29:16.257+00	2023-04-11 10:33:21.217+00
37df9edc-0eff-4765-b5ba-639ce1d30dda	\N	d0247d36-982d-4d82-b552-c28338bcc67c	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518"}	2023-04-11 10:12:26.415+00	2023-04-11 11:36:25.311+00
14f30586-bbb5-48c2-8091-f872c84f7169	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hello good morning 	f	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518"}	2023-04-11 10:09:27.34+00	2023-04-11 10:11:34.195+00
e6a93d7e-e1ea-4fa8-ae1a-4dfe421b9183	\N	25e7261a-dd11-425c-b01a-5796cf7895c8	43f8a619-acb4-40a5-a590-e64bef3dfa97	hy	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9"}	2023-04-12 08:49:37.282+00	2023-04-17 04:08:42.672+00
8dbbf42e-65b1-4937-96e2-4303ef0e97b1	\N	25e7261a-dd11-425c-b01a-5796cf7895c8	43f8a619-acb4-40a5-a590-e64bef3dfa97	hi coach	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9"}	2023-04-12 09:04:31.533+00	2023-04-17 04:08:42.678+00
f5e21b30-e88d-43ff-925c-06e290761c7f	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	f6b2b18e-e0fa-414f-b875-1e677074283f	\N	It went great! 	t	{}	2023-06-06 16:37:48.193+00	2023-06-06 16:49:19.42+00
4f258ef8-35d4-4bc0-852c-109474c42124	d0247d36-982d-4d82-b552-c28338bcc67c	74ca1b0a-82f9-4852-b8da-c1b33181a997	\N	hello everyone guts namaste 🙏 	t	{}	2023-04-11 11:35:45.218+00	2023-04-11 11:35:56.114+00
54906652-6a07-47af-87fa-1d89d4a64a7a	7f5b6fa9-e662-490b-819d-e10fdd790bda	657975cc-7b3e-49bd-8dc8-76e5cba3293f	\N	hy	t	{}	2023-04-12 10:21:14.475+00	2023-04-12 10:21:20.404+00
dbb42f61-8683-43d4-974a-c709b0621306	7f5b6fa9-e662-490b-819d-e10fdd790bda	657975cc-7b3e-49bd-8dc8-76e5cba3293f	\N	hy	t	{}	2023-04-12 10:21:24.057+00	2023-04-12 10:21:25.216+00
9c4c052c-7975-4554-a446-7119b464f94a	7f5b6fa9-e662-490b-819d-e10fdd790bda	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	\N	hy	t	{}	2023-04-12 10:38:15.031+00	2023-04-12 10:38:18.246+00
db692801-1e02-4312-a6c5-f4c8e1970ebc	7f5b6fa9-e662-490b-819d-e10fdd790bda	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	\N	hy	t	{}	2023-04-12 10:38:29.312+00	2023-04-12 10:38:32.666+00
519bd67c-9cfb-4552-9c90-e738f8d0ea43	7f5b6fa9-e662-490b-819d-e10fdd790bda	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	\N	hy	t	{}	2023-04-12 10:47:24.61+00	2023-04-12 10:47:31.559+00
c2bfe747-6159-4b38-ba04-83d757ed8239	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	f6b2b18e-e0fa-414f-b875-1e677074283f	\N	test when blocked 	t	{}	2023-06-06 16:50:15.113+00	2023-06-06 16:50:50.832+00
dacd3f26-502f-4147-914f-1d602ca1cc03	79254c3c-4ce5-48b5-8292-26a89ab2e122	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	\N	dkygdidfiy	t	{}	2023-04-07 06:52:30.764+00	2023-04-11 09:53:35.208+00
469c5ebb-39e2-43e5-af8e-7a9d6af62b49	d0247d36-982d-4d82-b552-c28338bcc67c	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	The first time 	t	{}	2023-04-11 10:12:37.922+00	2023-04-11 10:12:51.91+00
ae2a6f9a-748a-469c-bc3d-c635daf84949	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hy	t	{}	2023-04-11 10:30:13.296+00	2023-04-11 10:30:28.615+00
36ed6b41-907c-4d73-834d-17b27427f644	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hy	t	{}	2023-04-11 10:32:48.602+00	2023-04-11 10:32:49.215+00
82fd8319-1952-4ccb-8413-974bf960b212	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518"}	2023-04-11 10:05:38.203+00	2023-04-11 10:11:18.642+00
24f60a26-2f99-4884-977e-fe40f4f41123	7f5b6fa9-e662-490b-819d-e10fdd790bda	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	\N	hy	t	{}	2023-04-12 10:46:45.838+00	2023-04-12 10:47:11.705+00
421905c9-ca4e-49ad-9f28-c9e853fffd27	\N	3ff87fa1-3b13-48dd-9984-95ff58d3ed7b	327acc88-8f96-4c83-a3c7-6602e7132b0a	abela	f	{"17caaa25-81bd-4379-acc9-13f67e9d6fa7":"17caaa25-81bd-4379-acc9-13f67e9d6fa7"}	2024-03-06 18:42:13.558+00	2024-03-06 18:42:18.616+00
122c6e22-9745-4272-943a-5238c3125dee	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	2023-04-11 11:38:23.137+00	2023-06-26 11:08:59.288+00
654495d2-3941-4d66-b192-3f6d0cd9b5dd	\N	d0247d36-982d-4d82-b552-c28338bcc67c	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	The first 	f	{"74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	2023-04-11 11:38:29.982+00	2023-06-26 11:09:00.628+00
eb64ff13-4ffb-4213-a66b-3ca3fab23779	\N	d0247d36-982d-4d82-b552-c28338bcc67c	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518"}	2023-04-11 10:11:32.38+00	2023-04-11 10:12:12.893+00
5463ef16-b6ce-475a-9198-5c30cafcd9b7	\N	d0247d36-982d-4d82-b552-c28338bcc67c	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997"}	2023-04-11 10:51:09.694+00	2023-04-11 11:38:16.23+00
45202810-bdf4-40b0-8c0b-53802e4975d4	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 07:22:23.612+00	2023-04-07 07:22:44.208+00
6d591bcb-9843-4f3f-8aeb-2ce7add97d8d	657975cc-7b3e-49bd-8dc8-76e5cba3293f	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hy	t	{}	2023-04-12 10:17:52.909+00	2023-04-12 10:17:55.709+00
3636c4f2-d996-44e3-a24c-b4ce5af14f88	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hello 	t	{}	2023-04-07 06:36:32.26+00	2023-04-07 06:36:40.06+00
9f72eb6f-d7fd-44b3-ad37-21c29da46a36	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hyyyyy	t	{}	2023-04-07 06:36:27.041+00	2023-04-07 06:36:40.658+00
4638cd6e-6ede-4c53-a338-5601ec9a7670	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:26:13.222+00	2023-04-07 06:28:32.677+00
e6c06226-cd81-4caf-92ce-014744e1a88e	79254c3c-4ce5-48b5-8292-26a89ab2e122	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	\N	hy	t	{}	2023-04-07 06:36:19.193+00	2023-04-07 06:36:52.132+00
15d99936-4023-4bdf-bc0d-5977bf0602f5	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	yoyohuig	t	{}	2023-04-07 06:36:51.493+00	2023-04-07 06:36:57.293+00
0c4357c4-a256-46bd-99dc-656115869dd6	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hyyyyy 	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:26:17.939+00	2023-04-07 06:28:43.728+00
e9c00292-5813-499f-be90-ad70a8f9cce2	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hyyy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:26:37.207+00	2023-04-07 06:28:43.759+00
cbdff1bb-df8e-40bf-8ceb-b93d20cf77b9	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 07:22:16.645+00	2023-04-07 07:22:44.259+00
ce15112f-96bc-4d5c-9327-29e803bc895f	7f5b6fa9-e662-490b-819d-e10fdd790bda	657975cc-7b3e-49bd-8dc8-76e5cba3293f	\N	hello how are you?	t	{}	2023-04-12 10:21:47.829+00	2023-04-12 10:21:55.644+00
1ab3642c-5fac-4aaf-9ac0-8ba4483750bf	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:27:16.994+00	2023-04-07 06:28:43.762+00
4508c24c-85c9-494e-83e5-c0667234384b	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hi guys hi 👋 	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:27:09.807+00	2023-04-07 06:28:43.797+00
3f398d83-b3ee-4030-b97c-503eadb01996	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hyyyyyy hello 	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:26:57.009+00	2023-04-07 06:28:43.804+00
d4824560-9145-40f0-98dc-f280aa75971f	7f5b6fa9-e662-490b-819d-e10fdd790bda	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	\N	hy	t	{}	2023-04-12 10:38:21.657+00	2023-04-12 10:38:23.515+00
30f0b5b4-4c61-4c10-9f34-dd047d81000e	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hy	f	{}	2023-04-13 05:48:31.542+00	2023-04-13 05:48:31.542+00
c3731693-34ca-4154-b819-bd712a70bfac	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	f6b2b18e-e0fa-414f-b875-1e677074283f	\N	Hi	t	{}	2023-06-06 16:48:09.282+00	2023-06-06 16:49:19.403+00
12d88621-e146-4da0-9557-8741f5f17978	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hy	t	{}	2023-04-07 06:35:58.105+00	2023-04-07 06:36:02.304+00
285ce409-fc44-4639-87ad-3380cae0afca	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	79254c3c-4ce5-48b5-8292-26a89ab2e122	\N	hy	t	{}	2023-04-07 06:36:07.692+00	2023-04-07 06:36:19.802+00
01c57192-5b10-4cd7-aad4-534f267f0ce9	f6b2b18e-e0fa-414f-b875-1e677074283f	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	\N	Test blocked screen.	t	{}	2023-06-06 16:50:50.533+00	2023-06-06 16:51:05.174+00
35014d84-7061-4f45-a1ce-54475005f7d3	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hhhffhhdyiul	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:31:58.909+00	2023-04-07 07:22:44.251+00
ca9c87f3-ea57-4fe5-8d7c-e1769bd31483	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hyyyy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:27:28.459+00	2023-04-07 07:22:21.463+00
11a1d6fd-d336-4c49-9e80-4408d257d446	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:57:18.694+00	2023-04-07 07:22:44.211+00
904e55dd-8b92-4928-91c9-a2b5c9061af6	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hhy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:28:27.699+00	2023-04-07 07:22:29.759+00
d85c9d1a-56cc-407a-9b17-4b8429e43ae6	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	fjjffj	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:33:03.119+00	2023-04-07 07:22:44.214+00
2275b277-d838-4217-81e7-741d5df42701	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	gjffjgk	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:28:36.798+00	2023-04-07 07:22:45.31+00
19d6b14c-8ab1-4722-b503-5204573022c5	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hello hi 👋 	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 07:22:38.215+00	2023-04-07 07:22:44.217+00
9aa56c4b-15b6-4a87-9ab7-0cf4ea46c437	\N	79254c3c-4ce5-48b5-8292-26a89ab2e122	6ff10ec6-c23d-4676-b2cf-1bcd35a0800a	hyihgii	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b"}	2023-04-07 06:28:51.567+00	2023-04-07 07:22:44.256+00
3f35d55e-5a07-45b2-a395-ba3caa4f6e19	7f5b6fa9-e662-490b-819d-e10fdd790bda	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	\N	hello 	t	{}	2023-04-11 10:33:27.424+00	2023-04-11 10:33:31.387+00
32654371-6bec-40c4-bcdd-95fff141877a	\N	d0247d36-982d-4d82-b552-c28338bcc67c	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	2023-04-11 10:11:50.148+00	2023-04-11 10:50:00.139+00
d1c1513d-6bed-4db6-81bb-a29558fb934f	\N	7f5b6fa9-e662-490b-819d-e10fdd790bda	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c"}	2023-04-11 10:09:36.129+00	2023-04-11 10:12:07.183+00
e19e4954-bc63-4e73-a453-275c72b98f43	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hello 	f	{"d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	2023-04-11 10:11:41.636+00	2023-04-11 10:50:21.915+00
edaa96ed-725d-47d4-9cd9-94131625c47b	\N	25e7261a-dd11-425c-b01a-5796cf7895c8	43f8a619-acb4-40a5-a590-e64bef3dfa97	hello 	f	{"ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-12 08:55:38.341+00	2023-04-17 04:08:42.048+00
f29b01f3-c4fd-45fe-85ed-708f48b8bd34	\N	25e7261a-dd11-425c-b01a-5796cf7895c8	43f8a619-acb4-40a5-a590-e64bef3dfa97	good after 	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9"}	2023-04-12 08:53:57.247+00	2023-04-17 04:08:42.637+00
a684f056-553b-4ee3-a72b-b15e01a66cc0	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hyy guys 	f	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518"}	2023-04-11 10:12:02.837+00	2023-04-11 10:54:54.686+00
a8cc9a35-ea1c-4582-bc2e-ceaf849319f5	\N	d0247d36-982d-4d82-b552-c28338bcc67c	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997"}	2023-04-11 10:51:16.773+00	2023-04-11 12:03:03.316+00
71228400-a92f-4a32-a03f-b17a236a4069	7f5b6fa9-e662-490b-819d-e10fdd790bda	d0247d36-982d-4d82-b552-c28338bcc67c	\N	yes	t	{}	2023-04-11 10:12:51.301+00	2023-04-11 10:12:52.482+00
a5384ab7-a697-4f40-8423-497e920984c0	7f5b6fa9-e662-490b-819d-e10fdd790bda	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	\N	hy	t	{}	2023-04-11 10:30:19.731+00	2023-04-11 10:30:24.034+00
71120301-eacf-4c0a-8f28-b663224d56c8	657975cc-7b3e-49bd-8dc8-76e5cba3293f	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hello 	t	{}	2023-04-12 10:18:00.35+00	2023-04-12 10:18:03.771+00
bd2de352-bca4-4111-ac4c-2034247f0353	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-11 11:38:43.094+00	2023-04-28 10:04:06.535+00
67914dda-fefa-4cd8-905f-5664bdfbf9cb	f6b2b18e-e0fa-414f-b875-1e677074283f	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	\N	Test notification sounds	t	{}	2023-06-06 16:48:51.116+00	2023-06-06 16:50:15.652+00
7f8323d2-b56d-40fd-a8c8-dfb3a7e42e7a	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hello 	f	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518"}	2023-04-11 10:11:52.638+00	2023-04-11 10:54:54.694+00
aab88fc5-1709-409b-8611-b9a5c2afd131	d0247d36-982d-4d82-b552-c28338bcc67c	74ca1b0a-82f9-4852-b8da-c1b33181a997	\N	hy	t	{}	2023-04-11 11:34:34.613+00	2023-04-11 11:34:35.767+00
d653ae13-ce72-47ee-877b-fe78346a35c3	d0247d36-982d-4d82-b552-c28338bcc67c	74ca1b0a-82f9-4852-b8da-c1b33181a997	\N	hy	t	{}	2023-04-11 11:34:49.48+00	2023-04-11 11:34:52.919+00
0aa2d789-f081-4d1d-8371-3010533ba171	d0247d36-982d-4d82-b552-c28338bcc67c	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	\N	hy	t	{}	2023-04-11 10:13:04.326+00	2023-04-11 10:29:16.321+00
47dc19ed-e253-4140-a6fb-983ce9b400e2	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hello 	f	{"7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518"}	2023-04-11 10:09:48.641+00	2023-04-11 10:12:16.84+00
a4a57d82-ea3d-426a-9a1c-9ef57aff033d	d0247d36-982d-4d82-b552-c28338bcc67c	74ca1b0a-82f9-4852-b8da-c1b33181a997	\N	hyyy	t	{}	2023-04-11 11:34:59.5+00	2023-04-11 11:35:03.277+00
6ee45c91-894f-4876-83be-51a396b1f1f1	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hello dear 	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 09:25:45.089+00	2023-04-28 10:04:05.686+00
b3012d41-e8b2-4305-a972-2d56e89f496e	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 10:05:58.047+00	2023-04-28 10:04:06.537+00
c4f97adc-22a6-41ab-8d6c-28953fda2e04	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 09:26:07.321+00	2023-04-28 10:04:05.67+00
25a23d5c-1f0a-4741-ac99-ddf1d5aaee9b	7f5b6fa9-e662-490b-819d-e10fdd790bda	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	\N	hy	t	{}	2023-04-11 10:30:27.949+00	2023-04-11 10:32:49.225+00
62285173-af25-4967-b689-ecf6cfcf4940	7f5b6fa9-e662-490b-819d-e10fdd790bda	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	\N	hy	t	{}	2023-04-11 10:33:37.862+00	2023-04-11 10:33:40.812+00
c327df8c-eb4f-4d5c-ba37-060406c1de4a	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 09:30:08.315+00	2023-04-28 10:04:05.854+00
cdbd1f4d-61b6-40ae-867f-be0e6863a1e3	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 09:25:30.282+00	2023-04-28 10:04:05.696+00
8545fd74-bcc6-4b3d-8298-ca53a27181e8	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy sir	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 10:05:35.026+00	2023-04-28 10:04:06.533+00
3d32a413-f580-4fdf-afc5-717fd6e9e659	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	ht	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 09:26:16.861+00	2023-04-28 10:04:05.656+00
abce56c9-47b5-4382-8679-72bb9feb2f8e	\N	25e7261a-dd11-425c-b01a-5796cf7895c8	43f8a619-acb4-40a5-a590-e64bef3dfa97	hy everyone 	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9"}	2023-04-12 08:39:28.523+00	2023-04-12 08:54:03.472+00
e5e91e69-2563-4b8e-9b3a-eb0e0aee63a6	7f5b6fa9-e662-490b-819d-e10fdd790bda	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	\N	hy	t	{}	2023-04-12 10:47:08.622+00	2023-04-12 10:47:11.158+00
cdc151ff-c9e3-427d-b5d0-1f5101803d21	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 09:25:56.51+00	2023-04-28 10:04:05.668+00
9fc2ad56-07a5-4db9-b1ba-320303343235	657975cc-7b3e-49bd-8dc8-76e5cba3293f	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hello 👋 	t	{}	2023-04-12 10:18:11.448+00	2023-04-12 10:18:58.923+00
2edb83ef-5b40-4d54-9c14-12ab29bf6de7	7f5b6fa9-e662-490b-819d-e10fdd790bda	657975cc-7b3e-49bd-8dc8-76e5cba3293f	\N	The only 	t	{}	2023-04-12 10:23:32.857+00	2023-04-12 10:23:45.995+00
63e11d63-b6a0-45e7-830b-ea47afed0fe9	\N	25e7261a-dd11-425c-b01a-5796cf7895c8	43f8a619-acb4-40a5-a590-e64bef3dfa97	hy	f	{"1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9"}	2023-04-12 08:56:39.109+00	2023-04-17 04:08:42.003+00
31560efe-b57b-4cbd-a2c0-ab9c3d7b0171	657975cc-7b3e-49bd-8dc8-76e5cba3293f	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hello 	t	{}	2023-04-12 10:18:26.066+00	2023-04-12 10:18:58.932+00
5255aae9-a5a6-47b2-9df3-a14f18683501	657975cc-7b3e-49bd-8dc8-76e5cba3293f	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hy	t	{}	2023-04-12 10:23:45.944+00	2023-04-12 10:23:49.056+00
bd9a0cc4-3523-4496-af9b-0f6e9eb2f939	657975cc-7b3e-49bd-8dc8-76e5cba3293f	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hello hi 	t	{}	2023-04-12 10:23:52.778+00	2023-04-12 10:23:53.927+00
9b77d3f9-289d-430b-ae26-bf93b00ebaa9	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 10:05:48.73+00	2023-04-28 10:04:06.516+00
327bb7fc-1545-4018-90d4-eedab1537c73	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy sur	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 10:05:18.634+00	2023-04-28 10:04:05.865+00
159c2486-4510-4878-80e8-b2c380b663fd	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hello dear friend 	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 09:25:51.015+00	2023-04-28 10:04:05.684+00
4903fbbe-dba9-48f6-9cec-f5ccfac0ed9d	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	f90b554f-a4e3-43b5-b622-69853a1f73f1	hy	f	{"c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6"}	2023-04-07 09:25:18.926+00	2023-04-28 10:04:05.688+00
7d1510ad-0ab6-49c4-88f0-6a284ea17468	f6b2b18e-e0fa-414f-b875-1e677074283f	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	\N	Test 2	t	{}	2023-06-06 16:49:19.086+00	2023-06-06 16:50:15.661+00
6846fde7-44af-49e5-b1f3-edc9abcf32d7	d0247d36-982d-4d82-b552-c28338bcc67c	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hey	f	{}	2023-06-26 09:09:11.142+00	2023-06-26 09:09:11.142+00
b68a489f-04aa-4014-96cf-d1689bd48021	7f5b6fa9-e662-490b-819d-e10fdd790bda	d0247d36-982d-4d82-b552-c28338bcc67c	\N	hy	t	{}	2023-04-11 11:34:20.031+00	2023-06-26 09:09:11.232+00
9be8d4c5-e676-4fe8-a36b-05048f859b34	d0247d36-982d-4d82-b552-c28338bcc67c	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	how are you doing???	f	{}	2023-06-26 09:39:33.859+00	2023-06-26 09:39:33.859+00
fe02b593-b1b8-4620-a7c6-46d98a583ba8	\N	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hello hello hey hello hi hello 👋 hey 	f	{"d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	2023-04-11 11:37:22.266+00	2023-06-26 11:08:59.295+00
596aa1d8-95cd-4655-848a-0b814bd42a97	\N	74ca1b0a-82f9-4852-b8da-c1b33181a997	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	2023-04-11 11:38:09.222+00	2023-06-26 11:09:00.054+00
a120ff6d-a878-47ed-8d21-5dc9d5b899c7	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	8570e857-819c-4a1f-831b-72f90a2059ec	hi	f	{}	2023-08-17 05:47:45.398+00	2023-08-17 05:47:45.398+00
3d300a43-2ee6-40e8-8abd-e403e24f9803	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	7f5b6fa9-e662-490b-819d-e10fdd790bda	\N	hi	f	{}	2023-06-26 11:08:42.132+00	2023-06-26 11:08:42.132+00
4e895d45-b322-4bbe-92c7-40830a192c62	\N	74ca1b0a-82f9-4852-b8da-c1b33181a997	e69c7197-a1a8-4bf5-a91d-a74c9ca847a9	hy	f	{"d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	2023-04-11 11:38:40.439+00	2023-06-26 11:08:58.407+00
c5b61b47-e313-47b7-ad0b-d8f0ea0a708c	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	8570e857-819c-4a1f-831b-72f90a2059ec	hello	f	{}	2023-08-17 05:50:18.764+00	2023-08-17 05:50:18.764+00
a9a6d575-7a72-470a-86f2-3ae1b0275a12	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	9d5a2086-fc35-49ac-ade4-8690a88db24c	\N	hiiii	t	{}	2023-08-17 06:35:21.705+00	2023-10-20 13:11:42.763+00
08fa5600-51cb-45cc-9429-cca2da50e8df	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	y	f	{}	2023-10-09 04:46:17.468+00	2023-10-09 04:46:17.468+00
b8638665-f684-4815-93dc-f4c941dbe1ac	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	hiiiii	f	{"2b6aa620-df6c-43a6-92c6-1e4b3de4706b":"2b6aa620-df6c-43a6-92c6-1e4b3de4706b"}	2023-08-17 07:39:38.147+00	2023-08-17 07:41:19.716+00
32c21c37-098a-4a6a-a9a0-ebd9c9aa7b91	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	hiiii	f	{"2b6aa620-df6c-43a6-92c6-1e4b3de4706b":"2b6aa620-df6c-43a6-92c6-1e4b3de4706b"}	2023-08-17 06:47:20.999+00	2023-08-17 07:41:20.283+00
2a2f9c44-bfa2-493e-9776-c76618327bf4	a3629d4e-f26f-43cb-9c3e-5461022ff427	9d5a2086-fc35-49ac-ade4-8690a88db24c	\N	joiii	f	{}	2023-08-25 10:19:51.075+00	2023-08-25 10:19:51.075+00
4835b40e-6fb0-47e6-8d55-a4a0bfe96cc0	\N	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	5a0edfdc-a079-4e29-86e0-ac534e81f38b	team wears white 	f	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2023-10-01 14:53:00.96+00	2024-01-24 01:32:13.208+00
cb263ea5-6988-42b5-8823-bbebe9c39c4b	\N	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	5a0edfdc-a079-4e29-86e0-ac534e81f38b	what	f	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2023-10-01 14:46:38.296+00	2024-01-24 01:32:13.21+00
d6851871-2d88-49b5-ad12-6e2517f9b59b	\N	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	5a0edfdc-a079-4e29-86e0-ac534e81f38b	?	f	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2023-10-01 14:53:12.087+00	2024-01-24 01:32:13.253+00
0d66ec20-9b0e-4f92-8048-f261e3e0a6f5	\N	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	5a0edfdc-a079-4e29-86e0-ac534e81f38b	?	f	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2023-10-01 14:53:14.432+00	2024-01-24 01:32:13.255+00
3049bb40-4904-41d7-b589-328a489fe5ed	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	jc	f	{}	2023-10-09 04:46:18.187+00	2023-10-09 04:46:18.187+00
6503696e-bdba-4b7e-8bc1-468576438ca4	\N	c1b1395e-c9fa-4de4-b148-07d032e5f763	5a0edfdc-a079-4e29-86e0-ac534e81f38b	wear all white today 	f	{"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3"}	2023-10-01 14:45:17.843+00	2024-01-09 19:50:28.697+00
c38e25fc-b815-4ba3-9e1c-a214810eea9c	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	cog	f	{}	2023-10-09 04:46:18.948+00	2023-10-09 04:46:18.948+00
f9d10f91-c031-45bc-acdf-b6f4ef2dd874	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	cof	f	{}	2023-10-09 04:46:19.698+00	2023-10-09 04:46:19.698+00
183d90b7-2bae-4f40-82a6-d1207e31baef	a3629d4e-f26f-43cb-9c3e-5461022ff427	9d5a2086-fc35-49ac-ade4-8690a88db24c	\N	bh	f	{}	2023-10-10 10:21:00.346+00	2023-10-10 10:21:00.346+00
15a2e890-e9cb-4bdd-aa70-1c6b4c06b941	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	hi	f	{}	2023-10-05 11:25:09.257+00	2023-10-05 11:25:09.257+00
d2d19fa0-26c7-475c-80cd-831023f73603	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	😝	f	{}	2023-10-05 11:25:36.081+00	2023-10-05 11:25:36.081+00
a1fb160b-ba61-4d21-ba54-c0a64f169d3a	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	hi	f	{}	2023-10-05 11:26:57.312+00	2023-10-05 11:26:57.312+00
8a956612-dc25-469f-973b-540877bff0af	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	The 	f	{}	2023-10-05 11:27:25.452+00	2023-10-05 11:27:25.452+00
54843542-593d-4ca8-9878-5cb94d6afc2b	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	t	f	{}	2023-10-05 11:27:26.525+00	2023-10-05 11:27:26.525+00
d2866262-abc1-41d0-9ab4-34a37a1c8df9	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	v	f	{}	2023-10-05 11:27:27.104+00	2023-10-05 11:27:27.104+00
ec0627ec-576b-41f3-ae86-2ad93c9a0a76	a3629d4e-f26f-43cb-9c3e-5461022ff427	9d5a2086-fc35-49ac-ade4-8690a88db24c	\N	hi	f	{}	2023-10-05 11:29:04.931+00	2023-10-05 11:29:04.931+00
480971f4-b4f3-44ec-acd6-43a3186ee858	c1b1395e-c9fa-4de4-b148-07d032e5f763	228f909e-70d1-4b69-bae8-6f72cfee94aa	\N	can you send the invite 	t	{}	2023-09-27 14:20:29.953+00	2023-10-07 22:36:07.565+00
1ee2375a-cd43-43c6-b167-d440ee60d31c	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	hi	f	{}	2023-10-09 04:42:54.341+00	2023-10-09 04:42:54.341+00
f531b02e-3d44-47e4-b397-8fb9df9d8636	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	h	f	{}	2023-10-09 04:46:15.055+00	2023-10-09 04:46:15.055+00
4740ca8e-2c99-4534-9e8d-5106d2b21d44	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	g	f	{}	2023-10-09 04:46:15.584+00	2023-10-09 04:46:15.584+00
84a4ea49-8313-41ec-8801-fb09d9710be4	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	h	f	{}	2023-10-09 04:46:16.118+00	2023-10-09 04:46:16.118+00
10f5de44-6287-4a7a-947a-e1e26c51346a	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	g	f	{}	2023-10-09 04:46:16.554+00	2023-10-09 04:46:16.554+00
d37b0ae6-2f00-481b-befc-521d32bc188a	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	h	f	{}	2023-10-09 04:46:17.039+00	2023-10-09 04:46:17.039+00
9fe4528f-dc10-4884-9aa5-e5dc48d491a3	a3629d4e-f26f-43cb-9c3e-5461022ff427	9d5a2086-fc35-49ac-ade4-8690a88db24c	\N	ch	f	{}	2023-10-10 10:21:00.986+00	2023-10-10 10:21:00.986+00
6e7caeb0-2a4c-423e-a818-b365d226856a	a3629d4e-f26f-43cb-9c3e-5461022ff427	9d5a2086-fc35-49ac-ade4-8690a88db24c	\N	g	f	{}	2023-10-10 10:21:01.913+00	2023-10-10 10:21:01.913+00
8bb7ce7c-4523-4a3e-89b4-0d87cc3f2b7f	a3629d4e-f26f-43cb-9c3e-5461022ff427	9d5a2086-fc35-49ac-ade4-8690a88db24c	\N	test	f	{}	2023-10-10 10:21:12.542+00	2023-10-10 10:21:12.542+00
4cc59e3e-f422-4946-ae6a-00c5b6c3ab5c	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	hello	f	{}	2023-10-10 10:21:27.882+00	2023-10-10 10:21:27.882+00
9e2d00d7-2994-4547-a7de-2b958645769c	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	xgh	f	{}	2023-10-10 10:21:29.872+00	2023-10-10 10:21:29.872+00
e3a5b56c-8ef2-4e12-b7db-35285b647e70	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	hi	f	{}	2023-10-10 10:54:33.463+00	2023-10-10 10:54:33.463+00
09184b92-7f27-490d-b73a-a0639c60052d	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	test	f	{}	2023-10-10 10:54:38.332+00	2023-10-10 10:54:38.332+00
b1225279-16c6-49da-8584-e95daf53b75d	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	hi	f	{}	2023-10-11 08:42:07.986+00	2023-10-11 08:42:07.986+00
6cdb98cb-0e16-4a09-9c4a-0810d89263b2	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	how are you	f	{"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9"}	2023-10-11 08:42:17.286+00	2023-10-24 09:46:54.14+00
44f4e608-b3a4-4d3e-82a9-a569c0247af4	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	c	f	{"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9"}	2023-10-11 09:38:25.235+00	2023-10-24 09:46:54.146+00
58f8252c-d386-4ec0-8593-fc28ea4e2e8a	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	c	f	{"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9"}	2023-10-11 09:38:26.164+00	2023-10-24 09:47:50.803+00
2fa63c3f-f442-440e-99fa-1f6a61190084	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	g	f	{"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9"}	2023-10-11 09:38:27.411+00	2023-10-24 09:48:06.201+00
5a9f55aa-fec7-47db-9d95-a21a3ac7d178	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	f	f	{"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9"}	2023-10-11 09:38:26.581+00	2023-10-24 09:48:06.414+00
01e9e98c-1d11-4527-80a0-3b79ae738385	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	hi	f	{}	2023-10-11 10:20:14.843+00	2023-10-11 10:20:14.843+00
dd7c0c19-47b7-4e49-aa6c-b7d38c54896c	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	gi 	f	{}	2023-10-11 10:20:21.449+00	2023-10-11 10:20:21.449+00
33e6fa98-4f47-4efa-9618-368f0829a094	a3629d4e-f26f-43cb-9c3e-5461022ff427	9d5a2086-fc35-49ac-ade4-8690a88db24c	\N	v	f	{}	2023-10-11 10:32:53.632+00	2023-10-11 10:32:53.632+00
99449336-2e0d-467a-a88f-b6886e6c724a	a3629d4e-f26f-43cb-9c3e-5461022ff427	9d5a2086-fc35-49ac-ade4-8690a88db24c	\N	hi	f	{}	2023-10-11 10:47:00.78+00	2023-10-11 10:47:00.78+00
8b4b490b-1199-4f34-b7ab-6317c43224fc	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	he	f	{}	2023-10-11 10:47:10.921+00	2023-10-11 10:47:10.921+00
6759812b-bef9-441a-a191-096fef959164	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	mo	f	{}	2023-10-11 10:47:13.531+00	2023-10-11 10:47:13.531+00
1da12005-54bc-4715-a14f-b46b8378a6c6	\N	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	5a0edfdc-a079-4e29-86e0-ac534e81f38b	hello	f	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2023-10-13 14:05:13.14+00	2024-01-24 01:32:12.792+00
3488d802-935d-463f-8925-bd27158b7953	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	hi	f	{}	2023-10-12 06:06:09.556+00	2023-10-12 06:06:09.556+00
9e9b603b-fc45-46ad-b124-e64b89f7b47e	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	hi	f	{}	2023-10-12 06:07:19.352+00	2023-10-12 06:07:19.352+00
9b28507d-6a8c-4ba3-8b9b-d0d734b25028	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	fu	f	{}	2023-10-12 06:07:20.492+00	2023-10-12 06:07:20.492+00
77cac953-c38d-49a2-94e8-e9dc2eb7297a	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	g	f	{}	2023-10-12 06:07:21.491+00	2023-10-12 06:07:21.491+00
0512fd57-12b4-4650-8c5e-63b086e88bcb	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	fhu	f	{}	2023-10-12 06:07:41.898+00	2023-10-12 06:07:41.898+00
954e0b93-0b91-4ccf-940e-fb7be91862bc	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	fg	f	{}	2023-10-12 06:07:42.676+00	2023-10-12 06:07:42.676+00
8ff1c156-147a-47ee-8a9d-c9819d4e81fe	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	vi	f	{}	2023-10-12 06:07:43.489+00	2023-10-12 06:07:43.489+00
4c01ecdc-bc47-4592-8070-1be9ba881448	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	vjo	f	{}	2023-10-12 06:07:44.465+00	2023-10-12 06:07:44.465+00
eabf3854-c6f0-4af1-9e6b-dbf892d503fc	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	b	f	{}	2023-10-12 06:13:04.996+00	2023-10-12 06:13:04.996+00
b3a10a2e-d38c-40c4-b6ce-c5518e5be74d	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	g	f	{}	2023-10-12 06:13:05.525+00	2023-10-12 06:13:05.525+00
448a25bc-e0ab-4820-9fee-b12fed066cda	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	h	f	{}	2023-10-12 06:13:05.993+00	2023-10-12 06:13:05.993+00
e3af90a3-38c6-42fc-8cd1-6290622b70f1	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	h	f	{}	2023-10-12 06:13:06.426+00	2023-10-12 06:13:06.426+00
77786687-909c-4314-88bb-a1fee6bf8d90	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	y	f	{}	2023-10-12 06:13:06.87+00	2023-10-12 06:13:06.87+00
5a4360f7-99bc-47f9-ab67-526ce59d395b	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	y	f	{}	2023-10-12 06:13:07.325+00	2023-10-12 06:13:07.325+00
66b08879-0e8f-4a3d-84a1-90bdd73f1654	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	y	f	{}	2023-10-12 06:13:07.772+00	2023-10-12 06:13:07.772+00
faae0ec5-5b3d-4003-9936-245302a46544	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	h	f	{}	2023-10-12 06:13:08.29+00	2023-10-12 06:13:08.29+00
157c9c02-2305-446b-aafb-25b2b7f34dc4	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	cnc	f	{}	2023-10-12 06:13:09.224+00	2023-10-12 06:13:09.224+00
7d4b9817-12e6-4bcb-ba2f-f59f7e9783bc	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	cof	f	{}	2023-10-12 06:13:10.038+00	2023-10-12 06:13:10.038+00
89e4887d-7405-4d90-8b23-838e6693b26f	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	82a7b283-9cda-484b-8de1-11f0db950ff5	hi	f	{}	2023-10-12 11:44:11.485+00	2023-10-12 11:44:11.485+00
c4b2a34f-937d-449d-8f1b-5552358dd9d0	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	d94a2450-45ca-4b8f-9a15-b6d221baada5	fg	f	{}	2023-10-12 11:54:19.837+00	2023-10-12 11:54:19.837+00
913e78b6-bc67-48d8-89f4-c8b23e804061	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	d94a2450-45ca-4b8f-9a15-b6d221baada5	rgg	f	{}	2023-10-12 11:54:23.413+00	2023-10-12 11:54:23.413+00
328ea9ac-21ea-4a72-a667-9c0dbb2f2c37	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	d94a2450-45ca-4b8f-9a15-b6d221baada5	u	f	{}	2023-10-12 11:54:24.302+00	2023-10-12 11:54:24.302+00
2c82efc6-971b-46a0-88ce-b66787990ac9	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	d94a2450-45ca-4b8f-9a15-b6d221baada5	hello	f	{}	2023-10-16 05:04:06.794+00	2023-10-16 05:04:06.794+00
07d1912d-d445-4d4d-ac71-f58f654a697c	\N	82eeaa00-4577-43eb-8509-f126179b2b56	898100a9-d3b5-470d-acf5-8f5ad9b260d0	hi	f	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","e650763e-d8cd-48b8-a978-b12adbf159c4":"e650763e-d8cd-48b8-a978-b12adbf159c4"}	2024-01-24 01:25:18.612+00	2024-01-24 01:32:45.192+00
0c99e563-edd5-48e2-9190-2158666095d5	\N	10670a64-f419-48aa-b788-63ed4a3798a7	4d15f55a-fca2-483b-9d5e-03a7bfb13308	hello	f	{}	2023-10-16 05:19:15.677+00	2023-10-16 05:19:15.677+00
81ff85f2-9070-4ed8-9dc8-ec257a3b0761	\N	10670a64-f419-48aa-b788-63ed4a3798a7	4d15f55a-fca2-483b-9d5e-03a7bfb13308	hey bro	f	{}	2023-10-16 05:19:29.705+00	2023-10-16 05:19:29.705+00
47101f79-6fbc-491c-b1f7-490651bba9dc	\N	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	5a0edfdc-a079-4e29-86e0-ac534e81f38b	Let’s goooo	f	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2023-11-13 14:41:11.515+00	2024-01-24 01:32:12.921+00
c9d9567c-59aa-42c3-993e-c2721ef4512f	9d5a2086-fc35-49ac-ade4-8690a88db24c	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	\N	hey	f	{}	2023-10-20 13:11:42.712+00	2023-10-20 13:11:42.712+00
5eff4618-2e5a-4838-aa41-e716bc20b955	\N	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	5a0edfdc-a079-4e29-86e0-ac534e81f38b	what do we wear 	f	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2023-10-11 11:14:41.37+00	2024-01-24 01:32:13.247+00
2bfc277b-236a-4385-9ffe-78db07241ff6	\N	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	fffhjji	f	{}	2023-10-24 09:47:02.009+00	2023-10-24 09:47:02.009+00
8b848b9e-6fd1-413e-ab1b-58735606579f	\N	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	5a0edfdc-a079-4e29-86e0-ac534e81f38b	hello	f	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	2023-10-11 11:14:32.703+00	2024-01-24 01:32:13.249+00
99daf7a8-8c64-4119-9817-c231a520d925	\N	10670a64-f419-48aa-b788-63ed4a3798a7	4d15f55a-fca2-483b-9d5e-03a7bfb13308	hello	f	{}	2023-10-20 12:52:45.814+00	2023-10-20 12:52:45.814+00
81a79e81-a6f8-4569-99bc-d151f88a7d9b	\N	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	12fa232c-7bd4-4d83-a283-a0f1489e5185	hello	f	{}	2023-10-24 09:34:09.855+00	2023-10-24 09:34:09.855+00
c604effa-5342-4de2-a9be-f0857ec88d1b	\N	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	hyyyy	f	{}	2023-10-24 09:46:55.832+00	2023-10-24 09:46:55.832+00
95a585ae-b470-4243-9a73-530ced8dfb04	\N	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	chhhhhh ghhh hhhhjjjjjjkkkkjjjjjjjjjjjjjjjjjjjjjjj	f	{}	2023-10-24 09:47:47.208+00	2023-10-24 09:47:47.208+00
2a16b26e-f98e-4dbe-bad2-900e2709a6ff	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	12fa232c-7bd4-4d83-a283-a0f1489e5185	kem chh	f	{"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9"}	2023-10-12 11:53:56.866+00	2023-10-24 09:46:31.796+00
02d8a63a-63ae-451c-840b-1115699ab493	\N	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	12fa232c-7bd4-4d83-a283-a0f1489e5185	kdjdkdjdkdfjdjdjdj hdhdn	f	{}	2023-10-24 09:35:17.952+00	2023-10-24 09:35:17.952+00
4d52ab87-0318-44e3-b160-ed6751073a97	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	12fa232c-7bd4-4d83-a283-a0f1489e5185	jsk	f	{"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9"}	2023-10-12 11:53:49.838+00	2023-10-24 09:46:31.807+00
a0a7882b-fb3c-4cc1-ae23-6bf915a9037a	\N	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	hyfjfgj	f	{}	2023-10-24 09:46:58.026+00	2023-10-24 09:46:58.026+00
4c223c34-d08f-453f-ab01-5cecd9a90f97	\N	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	12fa232c-7bd4-4d83-a283-a0f1489e5185	shejdmddkfkdjdkdjdjdjdjdjdjfjdj	f	{}	2023-10-24 09:35:10.964+00	2023-10-24 09:35:10.964+00
5455646d-883b-4680-b0c5-773fcc3d5325	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	c	f	{"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9"}	2023-10-11 09:38:27.003+00	2023-10-24 09:48:06.272+00
0618dbda-f082-442c-bf58-b05de5dcd5fd	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	g	f	{"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9"}	2023-10-11 09:38:25.694+00	2023-10-24 09:47:26.315+00
9e58b6b8-4191-49a2-8c2f-ea16464e1629	\N	9d5a2086-fc35-49ac-ade4-8690a88db24c	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	h	f	{"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9":"b11ff58a-ce48-4e0c-a985-bb1d193e1ac9"}	2023-10-11 09:38:23.277+00	2023-10-24 09:46:54.151+00
37e5f86a-0616-4c11-9296-b696dc687981	\N	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	hregjg	f	{}	2023-10-24 09:47:00.225+00	2023-10-24 09:47:00.225+00
c0a341b0-47a8-4408-82f7-a77f893bc30c	\N	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	2b052cc9-78bb-4fe3-86d0-0ce805f4f563	Chugh ggggggghhhhghhhjbnbbb	f	{}	2023-10-24 09:47:37.153+00	2023-10-24 09:47:37.153+00
bed1b690-66a7-4964-9f96-22e59af2a1a4	\N	c1b1395e-c9fa-4de4-b148-07d032e5f763	5a0edfdc-a079-4e29-86e0-ac534e81f38b	Wear all white today 	f	{"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3"}	2023-09-27 14:16:00.004+00	2023-11-13 14:41:05.728+00
040abf58-d4c2-4929-a7d2-fdf940b8a03e	e650763e-d8cd-48b8-a978-b12adbf159c4	c1b1395e-c9fa-4de4-b148-07d032e5f763	\N	hi	t	{}	2024-01-24 01:27:18.03+00	2024-01-24 01:27:41.693+00
e0d13bf2-d470-4137-8ede-4401606a2e82	c1b1395e-c9fa-4de4-b148-07d032e5f763	e650763e-d8cd-48b8-a978-b12adbf159c4	\N	Hi	t	{}	2024-01-24 01:27:44.673+00	2024-01-24 01:28:46.405+00
\.


--
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modules (id, name, description, path, "moduleId", status, "createdAt", "updatedAt") FROM stdin;
1	Dashboard		Dashboard	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
2	User Information		User-Information	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
3	Merchandise		Merchandise	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
4	Paid User		Paid-User	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
6	User Role	User-Role	User-Role	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
7	Google Ads		adsgoogle	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
8	Highest User States		highest-user-states	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
9	Merchandise Refund		merchandise-refund	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
12	Reported Challenges		Challenges-Report	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
13	Add Merchandise		Add-Merchandise	3	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
14	Merchandise List		Merchandise-List	3	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
15	Add Role User		add-role-user	6	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
16	Role List		role-list	6	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
5	Referred User Track		Refered-User-Track	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
10	Sales Order		sales	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
11	Motivational Video	Media	media	\N	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
17	Add		add-media	11	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
18	List		media-list	11	t	2023-04-11 06:52:52.877+00	2023-04-11 06:52:52.877+00
\.


--
-- Data for Name: motivationalClips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."motivationalClips" (id, title, "videoId", "thumbnailId", "userId", "likeCount", "createdAt", "updatedAt") FROM stdin;
12485a87-82cf-420d-a9f7-abbf4e25b596	Motivation Video 1	1697569369669-813153662.mp4	1697569369669-813153662.jpg	2708368c-5909-4942-aeb2-f7ab3c8c8278	1	2023-10-17 19:02:51.132+00	2023-10-20 12:03:23.398+00
\.


--
-- Data for Name: motivationalClipsLikes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."motivationalClipsLikes" (id, "userId", items, "createdAt", "updatedAt") FROM stdin;
1c329c6c-2e09-4898-a674-0bbc424aa001	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	{"5adee29b-0a2b-44c9-bc5b-2faff0bc593b":["1681109771501-930209320.png","1681109771501-930209320.mp4"],"df74322c-cd20-433a-ba7c-17de081fd962":["1681109225473-162286955.png","1681109225473-162286955.mp4"]}	2023-04-10 06:52:22.862+00	2023-04-10 07:07:07.182+00
09316068-dad9-49a5-ad27-bbd8dc1aff05	7f5b6fa9-e662-490b-819d-e10fdd790bda	{}	2023-04-10 07:08:32.362+00	2023-06-27 08:56:52.434+00
cd902ca3-c4cb-4da6-a243-7622ad673c4c	9d5a2086-fc35-49ac-ade4-8690a88db24c	{"12485a87-82cf-420d-a9f7-abbf4e25b596":["1697569369669-813153662.jpg","1697569369669-813153662.mp4"],"e7f158c8-b2e6-4bf8-a7f8-cfa63df20bcf":["1690998270643-173850678.jpg","1690998270643-173850678.mp4"],"60c84c30-1c89-4337-b71f-5994a66d8cf9":["1681111010517-410838375.jpg","1681111010517-410838375.mp4"],"5adee29b-0a2b-44c9-bc5b-2faff0bc593b":["1681109771501-930209320.png","1681109771501-930209320.mp4"],"df74322c-cd20-433a-ba7c-17de081fd962":["1681109225473-162286955.png","1681109225473-162286955.mp4"]}	2023-07-29 05:19:31.903+00	2023-10-20 12:03:23.392+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, product, address, "receiverName", phone, "shippingAmount", "TotalAmount", "paymentId", status, "userId", "createdAt", "updatedAt") FROM stdin;
71e59cd2-9c23-4c74-9edd-1492a8ec0094	{"0e8799fa-0552-427f-b299-2156fd7b0334":{"avlQuantity":2}}	123, sky house, awesome road pal, yea, zudio,  2580, Arkansas 	golf player	2580250	3	21	642971a0-ce33-421b-90c9-9baefb83ae41	1	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-12 04:59:21.173+00	2023-04-12 04:59:21.173+00
a1ed9228-e71b-4160-a622-2db7d30a7c25	{"d4069b99-398a-42d3-90a7-8018e9e67f6e":{"avlQuantity":1,"m":1}}	123 years , The first road , , sky,  25809, Arkansas 	see invisible	9846543210	3	12	7f477b64-3541-4470-8a16-14f52fdf4c6f	1	657975cc-7b3e-49bd-8dc8-76e5cba3293f	2023-04-12 10:20:42.159+00	2023-04-12 10:20:42.159+00
320b3134-2f46-49ac-b7de-2467f255ab14	{"d4069b99-398a-42d3-90a7-8018e9e67f6e":{"avlQuantity":1,"m":1}}	10, people unfollowed , The new study , , I’m going ,  25801, Arkansas 	The only 	3698521470	3	12	413dd3a4-77b4-4999-9812-eb9cd0c40d48	3	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-13 05:44:08.122+00	2023-04-13 05:44:14.806+00
cde49259-c7ae-462a-900d-4d3f341b04f7	{"d49765ba-1f60-4088-9f88-99fdfe0469df":{"avlQuantity":1}}	10, people unfollowed , The new study , , I’m going ,  25801, Arkansas 	The only 	3698521470	3	8	8afe0cc4-2209-4329-b81f-449d3bef200b	1	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-13 05:45:08.548+00	2023-04-13 05:45:08.548+00
67689f45-8de3-4b3f-ac9f-ea6ba345d0c6	{"1d5a69ac-0b09-4163-8e41-47d392b65a44":{"avlQuantity":1}}	212 house number, area, , new york,  222222, New York 	sagar	835588	8	12	02f58b85-2a42-4e0d-8a02-402e6bc63675	3	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-19 07:25:00.437+00	2023-10-20 12:08:06.465+00
\.


--
-- Data for Name: parents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parents (id, "parentId", "childId", "createdAt", "updatedAt") FROM stdin;
6	d0247d36-982d-4d82-b552-c28338bcc67c	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-11 09:56:20.868+00	2023-04-11 09:56:20.868+00
7	d0247d36-982d-4d82-b552-c28338bcc67c	74ca1b0a-82f9-4852-b8da-c1b33181a997	2023-04-11 09:56:20.868+00	2023-04-11 09:56:20.868+00
8	929842c0-64eb-4369-96d1-306c4daf8f9d	74ca1b0a-82f9-4852-b8da-c1b33181a997	2023-04-11 12:29:45.521+00	2023-04-11 12:29:45.521+00
9	929842c0-64eb-4369-96d1-306c4daf8f9d	dac88882-c1c5-4855-b0e5-56492ef89f08	2023-04-11 12:29:45.521+00	2023-04-11 12:29:45.521+00
10	929842c0-64eb-4369-96d1-306c4daf8f9d	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	2023-04-11 12:36:31.251+00	2023-04-11 12:36:31.251+00
11	d0247d36-982d-4d82-b552-c28338bcc67c	976cf3fc-6935-4e69-9de2-df5b256b0ba6	2023-04-12 04:11:20.519+00	2023-04-12 04:11:20.519+00
12	657975cc-7b3e-49bd-8dc8-76e5cba3293f	9688397f-6b0a-4857-ba38-78d48f536ba3	2023-04-12 05:08:36.796+00	2023-04-12 05:08:36.796+00
13	657975cc-7b3e-49bd-8dc8-76e5cba3293f	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	2023-04-12 05:09:11.481+00	2023-04-12 05:09:11.481+00
18	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-12 09:56:36.625+00	2023-04-12 09:56:36.625+00
19	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-06 16:12:51.085+00	2023-06-06 16:12:51.085+00
20	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 05:53:46.567+00	2023-07-29 05:53:46.567+00
21	100b8123-688c-4af4-9a61-c4e147143aac	2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2	2023-09-16 09:43:29.605+00	2023-09-16 09:43:29.605+00
22	f55f9574-5100-4cda-b9bf-49811b672031	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2023-09-19 14:07:14.644+00	2023-09-19 14:07:14.644+00
23	228f909e-70d1-4b69-bae8-6f72cfee94aa	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2023-09-27 14:19:21.362+00	2023-09-27 14:19:21.362+00
29	74e7f5f9-d679-40da-959b-59cf9b8dadb4	5110e525-8d24-4aba-ba67-d224aaa03fce	2023-10-06 14:44:20.22+00	2023-10-06 14:44:20.22+00
30	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	d8dbc425-be21-4f3a-beab-a37e6397e24f	2023-10-20 13:13:38.76+00	2023-10-20 13:13:38.76+00
31	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2	2023-10-20 13:15:30.599+00	2023-10-20 13:15:30.599+00
32	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-10-20 13:15:43.735+00	2023-10-20 13:15:43.735+00
33	16ed92f3-f879-4699-81b5-e0d8fc6bb890	390a3e37-8a91-4ae4-987f-f671bd34a650	2024-01-08 03:46:49.288+00	2024-01-08 03:46:49.288+00
34	b710750d-4291-4c7c-b631-5e63d0b664df	390a3e37-8a91-4ae4-987f-f671bd34a650	2024-01-08 18:05:30.66+00	2024-01-08 18:05:30.66+00
35	82eeaa00-4577-43eb-8509-f126179b2b56	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2024-01-24 01:00:41.509+00	2024-01-24 01:00:41.509+00
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, "stripeId", "paymentMethod", amount, status, "userId", "createdAt", "updatedAt") FROM stdin;
642971a0-ce33-421b-90c9-9baefb83ae41	pi_3MvvloGxmncEko680Ea5fOx9	card	21	1	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-12 04:59:20.854+00	2023-04-12 04:59:20.854+00
7f477b64-3541-4470-8a16-14f52fdf4c6f	pi_3Mw0mpGxmncEko680xcwXxg9	card	12	1	657975cc-7b3e-49bd-8dc8-76e5cba3293f	2023-04-12 10:20:41.863+00	2023-04-12 10:20:41.863+00
8afe0cc4-2209-4329-b81f-449d3bef200b	pi_3MwIxkGxmncEko681AHhBQuF	card	8	1	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-13 05:45:08.257+00	2023-04-13 05:45:08.257+00
413dd3a4-77b4-4999-9812-eb9cd0c40d48	pi_3MwIwiGxmncEko680D5pBjE2	card	12	3	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-13 05:44:07.831+00	2023-04-13 10:31:50.746+00
02f58b85-2a42-4e0d-8a02-402e6bc63675	pi_3O2qRKGxmncEko680eICd4lX	card	12	3	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-10-19 07:25:00.107+00	2023-10-20 12:18:54.857+00
\.


--
-- Data for Name: photoalbums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photoalbums (id, name, items, "userId", "createdAt", "updatedAt") FROM stdin;
323aef9e-048d-47cc-b387-69e1e20cb741	bhbsbssbbs	{"1680938638896-125465035.png":"1680938638896-125465035.png","1680938638919-168292625.png":"1680938638919-168292625.png","1680938638928-601876326.jpg":"1680938638928-601876326.jpg","1680938639065-749018676.png":"1680938639065-749018676.png","1680938639070-22832886.png":"1680938639070-22832886.png","1680938639072-224743428.jpg":"1680938639072-224743428.jpg","1680938639072-100823476.jpg":"1680938639072-100823476.jpg","1680938639072-414828348.jpg":"1680938639072-414828348.jpg"}	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-08 07:23:59.088+00	2023-04-08 07:23:59.088+00
170c21f2-9672-4f91-a882-a28dd349db01	66577ut5	{"1680938823749-15766098.jpeg":"1680938823749-15766098.jpeg"}	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-08 07:27:03.771+00	2023-04-08 07:27:03.771+00
49c87b3a-5439-4ad8-88ce-84d09c832e6a	vvvcccxghh Ggggggg	{"1680938728775-348856691.jpg":"1680938728775-348856691.jpg","1680938728775-554869960.jpg":"1680938728775-554869960.jpg","1680938728776-780327685.jpg":"1680938728776-780327685.jpg","1680938728838-869158020.png":"1680938728838-869158020.png","1680938728893-575391714.jpg":"1680938728893-575391714.jpg","1680938728894-908229916.jpg":"1680938728894-908229916.jpg","1680938728895-557563062.jpg":"1680938728895-557563062.jpg","1680938728914-176049983.jpg":"1680938728914-176049983.jpg","1680938729040-678156383.jpg":"1680938729040-678156383.jpg","1680938729050-242438524.jpg":"1680938729050-242438524.jpg","1680938729057-5732009.jpg":"1680938729057-5732009.jpg"}	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-08 07:25:29.074+00	2023-04-08 07:28:28.685+00
d82e3d07-88f3-40f1-890b-4c3b5162d2eb	fig	{"1690607940751-499550409.jpg":"1690607940751-499550409.jpg"}	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 05:19:00.772+00	2023-07-29 05:19:00.772+00
4aa799d8-bedb-4aed-b3ed-a96808e1950b	The gi	{"1690607962226-514836283.jpg":"1690607962226-514836283.jpg"}	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 05:19:22.242+00	2023-07-29 05:19:22.242+00
f8a7d2a0-04b0-48f8-9597-80f66bde9c25	my album	{"1704261815206-555956530.jpg":"1704261815206-555956530.jpg"}	70aa1373-4ffc-4c85-9cbf-efa49ea37294	2024-01-03 06:03:35.24+00	2024-01-03 06:03:35.24+00
\.


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (id, name, description, items, "userId", "createdAt", "updatedAt") FROM stdin;
b805679d-a69c-4334-b50c-0713144cb675	Game time	mental prep music	{"aa5d7a35-d3f5-43d4-9917-da722cbe376e":"aa5d7a35-d3f5-43d4-9917-da722cbe376e","e88ebfef-11cb-4eb5-b834-3911de73de5e":"e88ebfef-11cb-4eb5-b834-3911de73de5e"}	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-06 13:27:29.803+00	2023-06-06 13:29:41.816+00
53ae6a3d-516e-4aa9-8dbe-09423cb6e22d	bans	\N	{}	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-06-26 11:02:01.641+00	2023-06-26 11:02:01.641+00
1fb83875-e40e-43c7-abe0-eafe4e48b18c	Training	Training	{"db7ca353-366f-47db-8d38-8b4f3bb870bd":"db7ca353-366f-47db-8d38-8b4f3bb870bd"}	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-26 02:16:23.269+00	2023-06-26 12:12:21.62+00
95a05ac6-6f1d-4db2-8575-b881b8a207d2	playlist 1	\N	{"22535351-281d-41b2-b5ca-bc8f4f2c4a60":"22535351-281d-41b2-b5ca-bc8f4f2c4a60"}	2a4171ab-148c-42be-8d73-707f618534b1	2023-06-26 16:05:16.105+00	2023-06-26 16:05:53.235+00
26e156cf-53ea-44f4-8ac4-51dbca1f6e0b	new playlist	\N	{}	1c950256-e659-4748-ae45-7b73410fdbe9	2024-03-18 17:15:02.838+00	2024-03-18 17:15:02.838+00
9fbb089d-0d08-4e53-a91f-ce1cb24c5fc2	haka	\N	{"addd5c8d-4274-4030-874a-e58752339c0a":"addd5c8d-4274-4030-874a-e58752339c0a","e1f12090-953e-43fe-bee9-7e5da5e6db01":"e1f12090-953e-43fe-bee9-7e5da5e6db01"}	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-06-26 11:01:57.24+00	2023-06-27 08:40:05.049+00
fe949ffb-3b73-4e12-a313-a1b038e79db5	test	\N	{}	79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-07-01 06:05:04.436+00	2023-07-01 06:05:04.436+00
4005a494-602a-4f4a-a261-ad4e1fdc9ff0	Game	\N	{"14396492-47aa-41a4-bdac-f5e2d557b1f5":"14396492-47aa-41a4-bdac-f5e2d557b1f5"}	b550f32f-1900-4782-aa09-8aea504fb0ee	2023-06-23 18:25:58.564+00	2023-08-14 13:49:39.871+00
03b7e35c-4eaf-4b2b-b925-ab6d10514b2a	Game	\N	{}	473086b3-3778-4b92-ab4c-c11b22421f3c	2023-06-23 21:18:40.81+00	2023-06-23 21:18:40.81+00
da25074d-1d55-4ce8-8c18-9af0437d5357	test playlist	testing	{"0fecf347-fbe3-430a-8dd6-47f1d6f27d13":"0fecf347-fbe3-430a-8dd6-47f1d6f27d13","ecded6ba-070e-4e2d-8247-34c667469807":"ecded6ba-070e-4e2d-8247-34c667469807","b274ed48-3f62-4bb3-b082-837bdba7cea6":"b274ed48-3f62-4bb3-b082-837bdba7cea6"}	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-07-01 06:06:22.92+00	2023-07-01 06:39:45.528+00
957df865-9cb2-4adf-ab23-ea785c6fc9b4	xd	dr	{"f7c2ee26-f10d-45cd-a86b-556288f8f088":"f7c2ee26-f10d-45cd-a86b-556288f8f088"}	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-09-16 09:50:36.943+00	2023-09-16 10:02:27.754+00
7d18599d-5527-45a1-ab0e-003f7af82178	First	\N	{"340c3288-ca4f-4066-8ddf-010d9a9339b5":"340c3288-ca4f-4066-8ddf-010d9a9339b5","15ebd74b-7f99-43f0-9279-7213439ad971":"15ebd74b-7f99-43f0-9279-7213439ad971","4aa055e9-4a37-43fd-aeab-8cb1f7ea6a6e":"4aa055e9-4a37-43fd-aeab-8cb1f7ea6a6e","6a66bb2b-823c-49b4-a8a3-9dc1e95e5c20":"6a66bb2b-823c-49b4-a8a3-9dc1e95e5c20","8af33bd2-bf84-4094-a62b-2b72b3359038":"8af33bd2-bf84-4094-a62b-2b72b3359038","66b623de-1847-4c18-bc16-ac1c548cdca6":"66b623de-1847-4c18-bc16-ac1c548cdca6","8018bdea-98a0-4bd2-82e1-50f4db3e1522":"8018bdea-98a0-4bd2-82e1-50f4db3e1522","5b421961-2abf-4fe9-ac72-7e3a368b2843":"5b421961-2abf-4fe9-ac72-7e3a368b2843"}	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 04:59:10.352+00	2023-10-16 05:21:46.957+00
666239c0-a55e-4422-9207-a7149a2b8dc2	goat	workout	{}	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2024-01-09 19:51:07.594+00	2024-01-09 19:51:07.594+00
43fa2992-f3ba-4928-9178-c7f057ef2a87	daquavis	\N	{"300cb3ce-8553-402f-a174-ae835b7cba90":"300cb3ce-8553-402f-a174-ae835b7cba90","0dcd859f-aa9f-4680-a21e-2e48205a8bc4":"0dcd859f-aa9f-4680-a21e-2e48205a8bc4"}	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2023-10-27 12:19:55.671+00	2024-01-09 19:52:42.46+00
a961343b-b2d6-42c3-b6d8-305590df37f5	work out 	\N	{}	31b62c8f-213d-4e1b-9695-0609c5170cfb	2024-01-16 00:17:15.686+00	2024-01-16 00:17:15.686+00
87016459-657a-45ac-9302-182824138747	soccer  playlist 	\N	{}	b5ad960f-bcbd-4fd5-a8ab-f3e86175cd9a	2024-01-16 00:23:45.491+00	2024-01-16 00:23:45.491+00
1290ad6e-65cf-4674-bb86-98d384ba3dbb	hey hype	music 	{}	31b62c8f-213d-4e1b-9695-0609c5170cfb	2024-01-24 01:54:58.888+00	2024-01-24 01:54:58.888+00
b70942c5-ffbb-4fa1-bd1b-d8649868efb6	Test 1	Testing 	{"af657515-c65b-443b-afbc-252b33934bd7":"af657515-c65b-443b-afbc-252b33934bd7","ce7ae0cd-7f39-440c-bc1c-016a5d6b0f7b":"ce7ae0cd-7f39-440c-bc1c-016a5d6b0f7b"}	e650763e-d8cd-48b8-a978-b12adbf159c4	2024-01-24 01:56:16.075+00	2024-01-24 02:02:17.152+00
5a7f89a5-d9fb-48c4-94ed-6fa637ade423	workout	\N	{}	b1506c9d-f34b-4591-9a0a-76712b7056d9	2024-03-17 17:07:26.4+00	2024-03-17 17:07:26.4+00
\.


--
-- Data for Name: postGameReviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."postGameReviews" (id, "matchVideoId", notes, ratings, "userId", date, "createdAt", "updatedAt") FROM stdin;
7bd7b980-941f-42ea-8939-0be467b27216	b5e5fb02-b494-458e-91b5-40757d700008	[{"title":"tv","subtitle":"gggh"}]	4	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-10	2023-04-10 11:01:32.647+00	2023-04-10 11:02:30.931+00
\.


--
-- Data for Name: pregamegoals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pregamegoals (id, title, subtitle, description, "userId", "createdAt", "updatedAt") FROM stdin;
75d94a19-1286-453c-aa50-5f0d7f9f4825	vvvbh	The first time you have 	The first time you have a chance at the game you will have a good time playing with the other people and I think that is the most fun part about the games you have played and how it works for the players to get a chance with them as a whole 	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-08 07:08:48.736+00	2023-04-08 07:08:48.736+00
55ddaa50-726e-4952-9ea9-7de5214f355a	ggixgiv	gciigig	I fgixicgigcifuuxfu7.; hydyfyyyyyyyyyyxtgzzgzgg vvvvvgg ghgv	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-08 07:10:16.341+00	2023-04-08 07:10:42.074+00
0071dd3c-fa41-4f27-a28c-be1b5172a98d	hh	fgbhf	debug hhftfvy gxrrxct gyftfesect ffttftfctf cf you yftfy hftdt gftdt fitted fyfct gfygyyf gfydyfy fugdgddh fhdhfhd fuhdgdd ghfdhdhyd gffhfff fhddhdhfy fufydhdhfh gfudyyfyddt dyydgdgddyfh	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-08 07:14:19.309+00	2023-04-08 07:14:19.309+00
39c033b7-d4c0-418c-ad65-dfd77927e84d	ghfucv	ffh	godchild	7d812252-ad98-434a-98af-ba059971b67f	2023-04-10 11:15:19.465+00	2023-04-10 11:15:19.465+00
a38f04f1-6049-4f31-b57f-7f6a9e2fa20f	hello 	apple 	hello hi hello hey hello 👋 	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-11 10:38:01.811+00	2023-04-11 10:38:01.811+00
cbb53b59-21f4-4dea-8d66-6e453e6584b9	ch	tfy	the neon the dudk	d0247d36-982d-4d82-b552-c28338bcc67c	2023-04-11 10:46:33.483+00	2023-04-11 10:46:47.295+00
7fbcbdeb-4f13-49d4-9996-d50f153576c1	Qualifying match	UCLA VS UF	We need to score ar least 2 girls more than them as we los the first leg of the match.	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-06 13:50:57.719+00	2023-06-06 13:50:57.719+00
a621d88c-130e-4c31-81ad-e307a19c8a37	test note	note	1234	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	2023-06-22 12:44:38.364+00	2023-06-22 12:44:38.364+00
0bec3226-02ae-409e-b97f-a09fdf40688d	t1	t1	t1	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-06-26 11:06:01.986+00	2023-06-26 11:06:01.986+00
5e17ef3b-230e-4176-b156-c048b43cbfc6	New Note	Note 1	Note 1	10670a64-f419-48aa-b788-63ed4a3798a7	2023-10-16 05:17:07.469+00	2023-10-16 05:17:07.469+00
b5b88cb8-340b-4db1-969c-55151973f985	Notes 2	Notes 2	Notes 2	10670a64-f419-48aa-b788-63ed4a3798a7	2023-10-16 05:18:17.363+00	2023-10-16 05:18:17.363+00
ee4c5a81-e4cc-4b21-a645-bff394894ef3	don’t lose	don’t lose 	don’t lose or your gay	b1506c9d-f34b-4591-9a0a-76712b7056d9	2023-10-21 23:51:10.397+00	2023-10-21 23:51:10.397+00
617afb59-ac2b-4968-9eac-108d615a4ae1	Boyle vs WJMS	Game 4	8 points. 4 rebounds. 2 steals. 	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2023-11-13 14:37:49.856+00	2023-11-13 14:41:27.203+00
\.


--
-- Data for Name: premiumUsers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."premiumUsers" ("userId", "expiryDate", "transactionId", "productId", "createdAt", "updatedAt") FROM stdin;
79254c3c-4ce5-48b5-8292-26a89ab2e122	2023-04-13 06:47:56+00	2000000304287264	get_hype.monthly	2023-04-07 06:25:24.385+00	2023-04-13 06:47:58.831+00
456b9492-371f-4b46-b627-92d50651e53b	2023-04-04 05:23:43+00	2000000304711961	get_hype.monthly	2023-04-04 04:20:21.399+00	2023-04-04 05:23:46.075+00
1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-11 11:09:59+00	2000000304711961	get_hype.monthly	2023-04-05 06:26:06.085+00	2023-04-11 11:10:06.496+00
8efe3d74-ce12-41da-b676-133a6c07dd43	2023-03-29 11:59:10+00	2000000304287264	get_hype.monthly	2023-03-29 10:58:25.964+00	2023-03-29 11:59:26.343+00
7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-04-14 12:08:10+00	2000000304287264	get_hype.monthly	2023-04-14 11:05:33.566+00	2023-04-14 12:08:47.764+00
25e7261a-dd11-425c-b01a-5796cf7895c8	2023-04-12 09:39:40+00	2000000304711961	get_hype.monthly	2023-04-12 05:43:27.198+00	2023-04-12 09:39:45.277+00
7d812252-ad98-434a-98af-ba059971b67f	2023-04-10 11:53:06+00	2000000304711961	get_hype.monthly	2023-04-10 11:07:53.522+00	2023-04-10 12:00:14.071+00
e3c3ebce-f2c8-403d-9894-b22a4df7fd84	2023-10-10 07:45:03+00	2000000304287264	get_hype.monthly	2023-04-10 06:45:08.714+00	2023-04-10 07:45:30.978+00
c1b1395e-c9fa-4de4-b148-07d032e5f763	2024-09-07 15:52:28+00	270001498039953	get_hype.yearly	2023-09-07 15:53:03.237+00	2023-09-07 15:53:03.237+00
10670a64-f419-48aa-b788-63ed4a3798a7	2023-09-08 20:40:41+00	2000000408722381	get_hype.yearly	2023-09-08 08:40:47.199+00	2023-09-08 20:40:59.978+00
\.


--
-- Data for Name: refers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refers (id, "userId", "referedUser", "referralCode", "createdAt", "updatedAt") FROM stdin;
2	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	48bb84ff-714f-4e7e-8172-359adfb1f13e	3fduxjzj3j	2023-04-08 04:18:56.209+00	2023-04-08 04:18:56.209+00
3	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	929842c0-64eb-4369-96d1-306c4daf8f9d	3fduxjzj3j	2023-04-08 04:58:41.538+00	2023-04-08 04:58:41.538+00
\.


--
-- Data for Name: refunds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refunds (id, amount, "userId", "paymentId", "orderId", "isRefunded", "createdAt", "updatedAt") FROM stdin;
da64a97c-f7d9-4f33-97c7-d0575839a6a5	12	79254c3c-4ce5-48b5-8292-26a89ab2e122	413dd3a4-77b4-4999-9812-eb9cd0c40d48	320b3134-2f46-49ac-b7de-2467f255ab14	t	2023-04-13 05:44:14.794+00	2023-04-13 10:31:50.738+00
b9f73def-c19c-478d-aeb0-9575f8784bc6	12	9d5a2086-fc35-49ac-ade4-8690a88db24c	02f58b85-2a42-4e0d-8a02-402e6bc63675	67689f45-8de3-4b3f-ac9f-ea6ba345d0c6	t	2023-10-20 12:08:06.458+00	2023-10-20 12:18:54.848+00
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, "challengeId", "reasonId", reason, "reportedUserId", "userId", "createdAt", "updatedAt") FROM stdin;
f5196435-f2a3-4412-b661-3d7ee4fbe851	82c05a27-ecf8-4c4e-83c6-5b45f818c077	15	\N	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-11-19 18:59:30.141+00	2023-11-19 18:59:30.141+00
5a84a538-7927-4763-885b-a7d99e704479	82c05a27-ecf8-4c4e-83c6-5b45f818c077	4	\N	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	9d5a2086-fc35-49ac-ade4-8690a88db24c	2024-01-09 15:52:09.302+00	2024-01-09 15:52:09.302+00
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, description, "createdAt", "updatedAt") FROM stdin;
1	player	player can manage their records	2023-03-29 10:39:30.245+00	2023-03-29 10:39:30.245+00
2	Coach	coach can view their players records	2023-03-29 10:39:30.245+00	2023-03-29 10:39:30.245+00
3	parents	parents can view their players records	2023-03-29 10:39:30.245+00	2023-03-29 10:39:30.245+00
4	Admin	admin has right to access all records.	2023-03-29 10:39:30.245+00	2023-03-29 10:39:30.245+00
5	SubAdmin	subAdmin has right to access all records.	2023-03-29 10:39:30.245+00	2023-03-29 10:39:30.245+00
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedules (id, type, name, description, location, date_time, duration, "arriveEarly", "teamId", "createdAt", "updatedAt") FROM stdin;
9e75da72-b34f-47b6-a13c-1677ff9c88c6	f	soccer game	\N	Surat Gujarat	2023-04-04 04:30:00+00	00:01:00	00:30:00	6fe73af9-eec2-4e94-b23b-3498e11f0de2	2023-04-04 04:22:08.776+00	2023-04-04 04:22:08.776+00
7c673cfe-e7a3-4eb2-a7d6-2d6953943770	t	cohfd	stfsfsihf	drhzohfzlgjsdjg	2023-04-02 09:37:00+00	\N	\N	6f329eeb-b98c-4599-9855-b048812c8721	2023-04-05 09:37:34.711+00	2023-04-05 09:37:34.711+00
522c23df-72f7-485d-b94c-92ed2c5ba56a	t	gitcitx	guzugsugdyidgiidigdgdgzigzjgzgzjgjgzjgjzjggj	ggghh this 	2023-04-07 10:35:00+00	01:00:00	00:04:00	23dbe06a-9d56-4937-be51-1d80ac021151	2023-04-07 10:35:31.093+00	2023-04-07 10:35:31.093+00
e460c73f-8d0e-4a42-b581-834aa2fee111	f	gagfaadha	ratfafhsfh	chai xbfhfx	2023-04-07 10:40:00+00	00:02:00	\N	6f329eeb-b98c-4599-9855-b048812c8721	2023-04-05 09:37:09.663+00	2023-04-07 10:36:41.683+00
9a0646c3-d77c-44fb-8e5f-92ca933f95aa	f	night game	this is night game for the all player	surat	2023-04-10 16:30:00+00	01:04:00	01:00:00	79859e57-421b-46d0-816e-eb3f5bfb2558	2023-04-10 11:31:57.773+00	2023-04-10 11:31:57.773+00
7b51c338-3819-49f2-b949-4dd8eb978f61	t	practice session 	practice makes you perfect 	Ahmedabad 	2023-04-10 11:43:00+00	01:14:00	00:33:00	79859e57-421b-46d0-816e-eb3f5bfb2558	2023-04-10 11:33:31.393+00	2023-04-10 11:34:26.486+00
3111f864-4938-4f3c-bcd0-3e122573b6f8	f	evening game	this is for all the students 	surat	2023-04-11 11:13:00+00	01:30:00	00:05:00	23dbe06a-9d56-4937-be51-1d80ac021151	2023-04-11 11:11:47.899+00	2023-04-11 11:11:47.899+00
0db5e545-d5ee-428f-b15d-921fbad3f309	f	the morning match	\N	indoor india	2023-04-12 06:43:00+00	03:00:00	01:00:00	3fc6845e-7b34-4040-b662-7476cde02484	2023-04-12 05:43:59.373+00	2023-04-12 05:44:24.333+00
4fe076eb-bdf5-405d-848f-7910f0cb5c9c	t	practice game for the all golf	this is for practice schedule	Surat Gujarat	2023-04-14 05:30:00+00	01:02:00	01:00:00	3fc6845e-7b34-4040-b662-7476cde02484	2023-04-12 05:45:37.681+00	2023-04-12 05:45:37.681+00
fbc483ca-7ade-4fb0-aea5-d02812b46b57	t	practice	\N	noyda	2023-04-12 05:52:00+00	04:00:00	\N	3fc6845e-7b34-4040-b662-7476cde02484	2023-04-12 05:49:01.922+00	2023-04-12 05:49:01.922+00
6c011e99-ee7b-4434-8e8f-13ccb10735a3	f	Game 1	Goats vs Storm	500 Malibu Lane Lexington, Ky 	2023-09-08 19:59:00+00	01:20:00	00:30:00	bf91474d-129e-449b-98e8-8082af726ba3	2023-09-07 20:00:31.19+00	2023-09-07 20:00:31.19+00
ebfa07e9-04f2-4fd9-93e2-58b35eaef882	f	test game	test game	surat	2023-10-21 13:46:00+00	01:02:00	00:15:00	51dccc5e-7775-472f-8bdf-fda5ed87905d	2023-10-20 12:47:46.574+00	2023-10-20 12:47:46.574+00
fc2c9635-d506-47a7-b36a-6762e061e278	f	Georgetown 	White Socks, White Shorts, 	259 Rosecrest Dr, Monroeville, PA 15146	2023-10-24 14:00:00+00	02:00:00	01:00:00	bf91474d-129e-449b-98e8-8082af726ba3	2023-10-24 11:35:15.6+00	2023-10-24 11:35:15.6+00
8ee0c1ca-dc9f-4f6a-9a85-8339e1711e55	f	Lexington Cubs	White Uniform 	JPP Field 	2023-10-24 11:37:05.555+00	\N	\N	bf91474d-129e-449b-98e8-8082af726ba3	2023-10-24 11:37:45.857+00	2023-10-24 11:37:45.857+00
14d70064-6566-44e2-804b-d66d1092609a	f	Test Team vs Eagles 	Field 1A White Jersey, White socks 	500 Start Lane, Lexington KY 40000	2023-11-12 19:00:00+00	01:30:00	00:45:00	630e7b0c-8de3-48e5-b67f-e38e88df4f4a	2023-11-11 00:39:05.642+00	2023-11-11 00:39:05.642+00
499e9e30-ffd1-459e-a4de-e173e99bb40d	f	one 	\N	518 Silverbrook Drive Danville, KY	2024-01-16 00:34:22.219+00	05:00:00	01:00:00	ff106e34-2992-49c3-8296-a8b8a3d875c5	2024-01-16 00:35:17.287+00	2024-01-16 00:35:17.287+00
bcf26155-c855-40a7-bab0-7f7e598a9577	f	Game 1	white uniform 	518 Silverbrook Drive Danville Ky 40422 	2024-01-25 01:12:00+00	02:00:00	01:59:00	dd4e06d2-986e-451d-a750-64f2b335dbb4	2024-01-24 01:14:30.083+00	2024-01-24 01:14:30.083+00
c8949a4e-c6b6-44b1-8920-61f24d027f1b	f	game	hdhdjr	addis ababa, ethiopia	2024-03-01 13:20:00+00	01:18:00	00:10:00	61ddd332-42eb-4858-8e89-c6dbaf2f61c0	2024-02-28 13:19:37.614+00	2024-02-28 13:19:37.614+00
576f2e28-18da-45d1-8aba-dc4fec9a81cb	f	new game	\N	ethiopia	2024-02-28 13:24:02.132+00	\N	\N	61ddd332-42eb-4858-8e89-c6dbaf2f61c0	2024-02-28 13:35:41.148+00	2024-02-28 13:35:41.148+00
20fd82d1-ce47-42dd-980c-4ef44af40054	f	adfaf	\N	adfasf	2024-03-02 13:35:00+00	00:08:00	00:00:00	61ddd332-42eb-4858-8e89-c6dbaf2f61c0	2024-02-28 13:36:10.696+00	2024-02-28 13:36:10.696+00
6873dcf4-02f9-4808-aeb8-4efe93c3990b	f	new game	asdfas	adfaf	2024-03-26 13:37:00+00	02:00:00	00:05:00	61ddd332-42eb-4858-8e89-c6dbaf2f61c0	2024-02-28 13:37:33.649+00	2024-02-28 13:37:33.649+00
0f4da9ad-1906-416e-b6e5-6aa067171422	f	asdfs	asdf	asdfasf	2024-02-29 18:51:00+00	04:00:00	01:00:00	61ddd332-42eb-4858-8e89-c6dbaf2f61c0	2024-02-28 18:52:17.399+00	2024-02-28 18:52:17.399+00
0ad20984-8928-4f9d-891c-07898fbfba5c	f	even new game	asdff	asdfasf	2024-03-05 18:33:00+00	01:00:00	01:00:00	61ddd332-42eb-4858-8e89-c6dbaf2f61c0	2024-03-04 18:33:39.98+00	2024-03-04 18:33:39.98+00
\.


--
-- Data for Name: shippingRates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."shippingRates" (amount, "userId", "createdAt", "updatedAt") FROM stdin;
8	0d609944-95c2-42ca-8e8e-5f19147f675e	2023-04-11 11:43:21.91+00	2023-06-27 11:35:28.657+00
\.


--
-- Data for Name: soccers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.soccers (id, "gameName", "goalsScored", assists, "shotsToGoal", "timeOfPosition", fouls, offsides, touches, turnover, "freeKick", "goalKick", "panaltyKick", "cornerKick", passes, "matchStatus", "blockedGoals", score, "userId", date, "createdAt", "updatedAt") FROM stdin;
bde03056-3eb7-4535-a0ab-54f8aa4069dc	UF first leg	1	0	3	90	0	2	45	2	1	0	0	2	23	2	2	1	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-05-23	2023-06-06 15:03:55.653+00	2023-06-06 15:03:55.653+00
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (id, name, url, "playlistId", "userId", "createdAt", "updatedAt") FROM stdin;
db7ca353-366f-47db-8d38-8b4f3bb870bd	Natalia Lafourcade Sus Grandes Exitos - 20 Mejores Canciones- Top Songs 2019.opus	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2Ff6b2b18e-e0fa-414f-b875-1e677074283f%2FMusic%2F1fb83875-e40e-43c7-abe0-eafe4e48b18c%2FNatalia%20Lafourcade%20Sus%20Grandes%20Exitos%20-%2020%20Mejores%20Canciones-%20Top%20Songs%202019.opus?alt=media&token=f20e0c23-5ce2-4cff-b636-9ca49b00db14	1fb83875-e40e-43c7-abe0-eafe4e48b18c	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-26 12:12:21.608+00	2023-06-26 12:12:21.608+00
22535351-281d-41b2-b5ca-bc8f4f2c4a60	Over the Horizon	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F2a4171ab-148c-42be-8d73-707f618534b1%2FMusic%2F95a05ac6-6f1d-4db2-8575-b881b8a207d2%2FOver%20the%20Horizon?alt=media&token=f3533b18-6514-4fa3-9608-73574eabf5ee	95a05ac6-6f1d-4db2-8575-b881b8a207d2	2a4171ab-148c-42be-8d73-707f618534b1	2023-06-26 16:05:53.228+00	2023-06-26 16:05:53.228+00
addd5c8d-4274-4030-874a-e58752339c0a	Kesariya(PagalWorld.com.se).m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F7f5b6fa9-e662-490b-819d-e10fdd790bda%2FMusic%2F9fbb089d-0d08-4e53-a91f-ce1cb24c5fc2%2FKesariya(PagalWorld.com.se).m4a?alt=media&token=444c29c2-c4fd-425c-bc41-4bdc0516b4d2	9fbb089d-0d08-4e53-a91f-ce1cb24c5fc2	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-06-27 08:37:38.51+00	2023-06-27 08:37:38.51+00
e1f12090-953e-43fe-bee9-7e5da5e6db01	Main Dhoondne Ko Zamaane Mein - PagalWorld.com.m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F7f5b6fa9-e662-490b-819d-e10fdd790bda%2FMusic%2F9fbb089d-0d08-4e53-a91f-ce1cb24c5fc2%2FMain%20Dhoondne%20Ko%20Zamaane%20Mein%20-%20PagalWorld.com.m4a?alt=media&token=6524ff1c-e839-41f9-84e2-8446853a09f1	9fbb089d-0d08-4e53-a91f-ce1cb24c5fc2	7f5b6fa9-e662-490b-819d-e10fdd790bda	2023-06-27 08:40:05.041+00	2023-06-27 08:40:05.041+00
0fecf347-fbe3-430a-8dd6-47f1d6f27d13	Kesariya(PagalWorld.com.se).m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2Ff6b2b18e-e0fa-414f-b875-1e677074283f%2FMusic%2Fda25074d-1d55-4ce8-8c18-9af0437d5357%2FKesariya(PagalWorld.com.se).m4a?alt=media&token=6ebe0dca-525f-4e52-99ad-50aa7f7264fb	da25074d-1d55-4ce8-8c18-9af0437d5357	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-07-01 06:07:33.572+00	2023-07-01 06:07:33.572+00
ecded6ba-070e-4e2d-8247-34c667469807	Deva Deva(MyMp3Song).m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2Ff6b2b18e-e0fa-414f-b875-1e677074283f%2FMusic%2Fda25074d-1d55-4ce8-8c18-9af0437d5357%2FDeva%20Deva(MyMp3Song).m4a?alt=media&token=4e1ce775-b3ee-4ffd-9bea-ee8cc328fded	da25074d-1d55-4ce8-8c18-9af0437d5357	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-07-01 06:39:32.175+00	2023-07-01 06:39:32.175+00
b274ed48-3f62-4bb3-b082-837bdba7cea6	Dil (Shreya’S Version)(MyMp3Song).m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2Ff6b2b18e-e0fa-414f-b875-1e677074283f%2FMusic%2Fda25074d-1d55-4ce8-8c18-9af0437d5357%2FDil%20(Shreya%E2%80%99S%20Version)(MyMp3Song).m4a?alt=media&token=e2cbd5b8-4e54-4afa-a712-4a59c1388d82	da25074d-1d55-4ce8-8c18-9af0437d5357	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-07-01 06:39:45.519+00	2023-07-01 06:39:45.519+00
340c3288-ca4f-4066-8ddf-010d9a9339b5	Saath Ho Tera (Pagalworld.pw).m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F9d5a2086-fc35-49ac-ade4-8690a88db24c%2FMusic%2F7d18599d-5527-45a1-ab0e-003f7af82178%2FSaath%20Ho%20Tera%20(Pagalworld.pw).m4a?alt=media&token=78beb80c-40a6-4ead-beff-6f00e3241f13	7d18599d-5527-45a1-ab0e-003f7af82178	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 05:03:25.086+00	2023-07-29 05:03:25.086+00
15ebd74b-7f99-43f0-9279-7213439ad971	Main Dhoondne Ko Zamaane Mein - PagalWorld.com.m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F9d5a2086-fc35-49ac-ade4-8690a88db24c%2FMusic%2F7d18599d-5527-45a1-ab0e-003f7af82178%2FMain%20Dhoondne%20Ko%20Zamaane%20Mein%20-%20PagalWorld.com.m4a?alt=media&token=17e021ea-997f-4d54-8026-0ac7b7386d70	7d18599d-5527-45a1-ab0e-003f7af82178	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 05:03:36.75+00	2023-07-29 05:03:36.75+00
4aa055e9-4a37-43fd-aeab-8cb1f7ea6a6e	Kesariya(PagalWorld.com.se).m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F9d5a2086-fc35-49ac-ade4-8690a88db24c%2FMusic%2F7d18599d-5527-45a1-ab0e-003f7af82178%2FKesariya(PagalWorld.com.se).m4a?alt=media&token=0b5f9478-a9c9-4bcc-9be2-32ba55db8666	7d18599d-5527-45a1-ab0e-003f7af82178	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 05:03:47.754+00	2023-07-29 05:03:47.754+00
6a66bb2b-823c-49b4-a8a3-9dc1e95e5c20	Kashmir Main Tu Kanyakumari - PagalWorld.com.m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F9d5a2086-fc35-49ac-ade4-8690a88db24c%2FMusic%2F7d18599d-5527-45a1-ab0e-003f7af82178%2FKashmir%20Main%20Tu%20Kanyakumari%20-%20PagalWorld.com.m4a?alt=media&token=1b8e524b-c72f-4ebb-93ce-bf401ca40031	7d18599d-5527-45a1-ab0e-003f7af82178	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 05:04:35.354+00	2023-07-29 05:04:35.354+00
aa5d7a35-d3f5-43d4-9917-da722cbe376e	Dj Tiesto Mix Greatest Hits.mp3	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2Ff6b2b18e-e0fa-414f-b875-1e677074283f%2FMusic%2Fb805679d-a69c-4334-b50c-0713144cb675%2FDj%20Tiesto%20Mix%20Greatest%20Hits.mp3?alt=media&token=61933d2f-8788-445b-bf23-0ad57fb333b6	b805679d-a69c-4334-b50c-0713144cb675	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-06 13:28:58.878+00	2023-06-06 13:28:58.878+00
e88ebfef-11cb-4eb5-b834-3911de73de5e	Over_the_Horizon.mp3	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2Ff6b2b18e-e0fa-414f-b875-1e677074283f%2FMusic%2Fb805679d-a69c-4334-b50c-0713144cb675%2FOver_the_Horizon.mp3?alt=media&token=48dc36f2-a435-42f3-9194-4814e07b9fb1	b805679d-a69c-4334-b50c-0713144cb675	f6b2b18e-e0fa-414f-b875-1e677074283f	2023-06-06 13:29:41.802+00	2023-06-06 13:29:41.802+00
8af33bd2-bf84-4094-a62b-2b72b3359038	Pappi Jhappi (Govinda Naam Mera)(MyMp3Song).m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F9d5a2086-fc35-49ac-ade4-8690a88db24c%2FMusic%2F7d18599d-5527-45a1-ab0e-003f7af82178%2FPappi%20Jhappi%20(Govinda%20Naam%20Mera)(MyMp3Song).m4a?alt=media&token=a961479d-b0e0-4cf6-ac62-b1ba6a78a711	7d18599d-5527-45a1-ab0e-003f7af82178	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 05:06:56.288+00	2023-07-29 05:06:56.288+00
66b623de-1847-4c18-bc16-ac1c548cdca6	Jhoome Jo Pathaan (Pathaan)(MyMp3Song).m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F9d5a2086-fc35-49ac-ade4-8690a88db24c%2FMusic%2F7d18599d-5527-45a1-ab0e-003f7af82178%2FJhoome%20Jo%20Pathaan%20(Pathaan)(MyMp3Song).m4a?alt=media&token=15f11181-3f41-4b3f-8977-cdca92480fd7	7d18599d-5527-45a1-ab0e-003f7af82178	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 05:07:39.245+00	2023-07-29 05:07:39.245+00
8018bdea-98a0-4bd2-82e1-50f4db3e1522	Dil (Shreya’S Version)(MyMp3Song).m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F9d5a2086-fc35-49ac-ade4-8690a88db24c%2FMusic%2F7d18599d-5527-45a1-ab0e-003f7af82178%2FDil%20(Shreya%E2%80%99S%20Version)(MyMp3Song).m4a?alt=media&token=1716d5b2-bc6b-4ba3-8929-c7139aae91de	7d18599d-5527-45a1-ab0e-003f7af82178	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 05:08:21.669+00	2023-07-29 05:08:21.669+00
5b421961-2abf-4fe9-ac72-7e3a368b2843	Taake Jhanke - PagalWorld.com.m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F9d5a2086-fc35-49ac-ade4-8690a88db24c%2FMusic%2F7d18599d-5527-45a1-ab0e-003f7af82178%2FTaake%20Jhanke%20-%20PagalWorld.com.m4a?alt=media&token=a18d3fce-5a83-46ff-95ba-68af696cd3ef	7d18599d-5527-45a1-ab0e-003f7af82178	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-07-29 05:08:56.374+00	2023-07-29 05:08:56.374+00
14396492-47aa-41a4-bdac-f5e2d557b1f5	01 - God's Not Done with You (Single Version)_305e3344-09d0-423b-8ef2-eb2a26580d5e.mp3	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2Fb550f32f-1900-4782-aa09-8aea504fb0ee%2FMusic%2F4005a494-602a-4f4a-a261-ad4e1fdc9ff0%2F01%20-%20God's%20Not%20Done%20with%20You%20(Single%20Version)_305e3344-09d0-423b-8ef2-eb2a26580d5e.mp3?alt=media&token=f1dffec9-5495-45fc-aa37-0f0104bb56b3	4005a494-602a-4f4a-a261-ad4e1fdc9ff0	b550f32f-1900-4782-aa09-8aea504fb0ee	2023-08-14 13:49:39.861+00	2023-08-14 13:49:39.861+00
300cb3ce-8553-402f-a174-ae835b7cba90	My Jesus.m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F68c0b5c1-b74e-4cad-a3f3-b2a534a463e3%2FMusic%2F43fa2992-f3ba-4928-9178-c7f057ef2a87%2FMy%20Jesus.m4a?alt=media&token=f62b675c-30d6-4aa5-b7e8-f077a23af630	43fa2992-f3ba-4928-9178-c7f057ef2a87	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2024-01-09 19:52:09.676+00	2024-01-09 19:52:09.676+00
f7c2ee26-f10d-45cd-a86b-556288f8f088	Main Dhoondne Ko Zamaane Mein - PagalWorld.com.m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F9d5a2086-fc35-49ac-ade4-8690a88db24c%2FMusic%2F957df865-9cb2-4adf-ab23-ea785c6fc9b4%2FMain%20Dhoondne%20Ko%20Zamaane%20Mein%20-%20PagalWorld.com.m4a?alt=media&token=c82f0090-6636-4071-b321-bc2e0e0c8770	957df865-9cb2-4adf-ab23-ea785c6fc9b4	9d5a2086-fc35-49ac-ade4-8690a88db24c	2023-09-16 10:02:27.74+00	2023-09-16 10:02:27.74+00
0dcd859f-aa9f-4680-a21e-2e48205a8bc4	Biblical.m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2F68c0b5c1-b74e-4cad-a3f3-b2a534a463e3%2FMusic%2F43fa2992-f3ba-4928-9178-c7f057ef2a87%2FBiblical.m4a?alt=media&token=a57b7046-84cd-40c1-9a96-1a96d043868b	43fa2992-f3ba-4928-9178-c7f057ef2a87	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2024-01-09 19:52:42.455+00	2024-01-09 19:52:42.455+00
af657515-c65b-443b-afbc-252b33934bd7	Best The Beatles Songs Collection - The Beatles Greatest Hits Full Album 2021.opus	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2Fe650763e-d8cd-48b8-a978-b12adbf159c4%2FMusic%2Fb70942c5-ffbb-4fa1-bd1b-d8649868efb6%2FBest%20The%20Beatles%20Songs%20Collection%20-%20The%20Beatles%20Greatest%20Hits%20Full%20Album%202021.opus?alt=media&token=8929c87b-7ce3-4e9e-9a4f-0ed0bbd033e3	b70942c5-ffbb-4fa1-bd1b-d8649868efb6	e650763e-d8cd-48b8-a978-b12adbf159c4	2024-01-24 01:59:19.578+00	2024-01-24 01:59:19.578+00
ce7ae0cd-7f39-440c-bc1c-016a5d6b0f7b	Over_the_Horizon.m4a	https://firebasestorage.googleapis.com/v0/b/get-hype-43efa.appspot.com/o/Files%2Fe650763e-d8cd-48b8-a978-b12adbf159c4%2FMusic%2Fb70942c5-ffbb-4fa1-bd1b-d8649868efb6%2FOver_the_Horizon.m4a?alt=media&token=f322139a-1eda-4c96-bd92-689ee4e19b6f	b70942c5-ffbb-4fa1-bd1b-d8649868efb6	e650763e-d8cd-48b8-a978-b12adbf159c4	2024-01-24 02:02:17.089+00	2024-01-24 02:02:17.089+00
\.


--
-- Data for Name: sports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sports (id, name, description, "createdAt", "updatedAt") FROM stdin;
1	Soccer	a game involving two teams of 11 players who try to maneuver the ball into the other team's goal without using their hands or arms	2023-03-29 10:39:41.918+00	2023-03-29 10:39:41.918+00
2	Basketball	It is a team sport that involves two teams of five active players each trying to score points against one another by throwing a ball through a 300 cm (10 feet) high hoop (the 'basket') under organised rules	2023-03-29 10:39:41.918+00	2023-03-29 10:39:41.918+00
3	Baseball	a bat-and-ball sport played between two teams of nine players each, taking turns batting and fielding.	2023-03-29 10:39:41.918+00	2023-03-29 10:39:41.918+00
4	Football	 a game involving two teams of 11 players who try to maneuver the ball into the other team's goal without using their hands or arms.	2023-03-29 10:39:41.918+00	2023-03-29 10:39:41.918+00
5	Volleyball	a team sport in which two teams of six players are separated by a net.	2023-03-29 10:39:41.918+00	2023-03-29 10:39:41.918+00
6	Golf	a game played in an open field where the golfer plays his golf ball into a hole by using different types of clubs (golf instruments).	2023-03-29 10:39:41.918+00	2023-03-29 10:39:41.918+00
7	Tennis	a racket sport that is played either individually against a single opponent (singles) or between two teams of two players each (doubles).	2023-03-29 10:39:41.918+00	2023-03-29 10:39:41.918+00
8	Hockey	outdoor game played by two opposing teams of 11 players each who use sticks curved at the striking end to hit a small, hard ball into their opponent's goal	2023-03-29 10:39:41.918+00	2023-03-29 10:39:41.918+00
9	Lacrosse	There are ten players on each team: three attackmen, three midfielders, three defensemen, and one goalie	2023-03-29 10:39:41.918+00	2023-03-29 10:39:41.918+00
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, name, abbreviation, "createdAt", "updatedAt") FROM stdin;
1	Alabama	AL	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
2	Alaska	AK	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
3	Arizona	AZ	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
4	Arkansas	AR	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
5	California	CA	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
6	Colorado	CO	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
7	Connecticut	CT	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
8	Delaware	DE	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
9	Florida	FL	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
10	Georgia	GA	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
11	Hawaii	HI	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
12	Idaho	ID	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
13	Illinois	IL	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
14	Indiana	IN	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
15	Iowa	IA	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
16	Kansas	KS	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
17	Kentucky	KY	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
18	Louisiana	LA	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
19	Maine	ME	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
20	Maryland	MD	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
21	Massachusetts	MA	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
22	Michigan	MI	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
23	Minnesota	MN	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
24	Mississippi	MS	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
25	Missouri	MO	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
26	Montana	MT	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
27	Nebraska	NE	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
28	Nevada	NV	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
29	New Hampshire	NH	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
30	New Jersey	NJ	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
31	New Mexico	NM	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
32	New York	NY	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
33	North Carolina	NC	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
34	North Dakota	ND	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
35	Ohio	OH	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
36	Oklahoma	OK	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
37	Oregon	OR	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
38	Pennsylvania	PA	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
39	Rhode Island	RI	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
40	South Carolina	SC	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
41	South Dakota	SD	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
42	Tennessee	TN	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
43	Texas	TX	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
44	Utah	UT	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
45	Vermont	VT	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
46	Virginia	VA	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
47	Washington	WA	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
48	West Virginia	WV	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
49	Wisconsin	WI	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
50	Wyoming	WY	2023-03-29 10:39:58.541+00	2023-03-29 10:39:58.541+00
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, "teamProfile", name, description, link, members, "creatorId", "createdAt", "updatedAt") FROM stdin;
666a063c-b977-4f2e-a93f-35a78f5bb7c2	1680086618005-294823861.jpg	fzfjsgi	drktdiypsptusu	https://gethype.page.link/8aph	{"8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43"}	8efe3d74-ce12-41da-b676-133a6c07dd43	2023-03-29 10:43:32.389+00	2023-03-29 10:43:38.013+00
23dbe06a-9d56-4937-be51-1d80ac021151	1680687656895-881464191.jpg	hfzgfzgdzgd	xfhzfhkzhkkhf	https://gethype.page.link/SgsK	{"1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","79254c3c-4ce5-48b5-8292-26a89ab2e122":"79254c3c-4ce5-48b5-8292-26a89ab2e122","d0247d36-982d-4d82-b552-c28338bcc67c":"d0247d36-982d-4d82-b552-c28338bcc67c"}	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-04-05 09:40:52.767+00	2023-04-11 11:08:53.717+00
79859e57-421b-46d0-816e-eb3f5bfb2558	1681124250000-456750904.jpg	team beautiful 	this is the team for awesome peoples	https://gethype.page.link/v6dQ	{"7d812252-ad98-434a-98af-ba059971b67f":"7d812252-ad98-434a-98af-ba059971b67f","8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","929842c0-64eb-4369-96d1-306c4daf8f9d":"929842c0-64eb-4369-96d1-306c4daf8f9d","2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2":"2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2","48bb84ff-714f-4e7e-8172-359adfb1f13e":"48bb84ff-714f-4e7e-8172-359adfb1f13e","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","9688397f-6b0a-4857-ba38-78d48f536ba3":"9688397f-6b0a-4857-ba38-78d48f536ba3","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997","dac88882-c1c5-4855-b0e5-56492ef89f08":"dac88882-c1c5-4855-b0e5-56492ef89f08","976cf3fc-6935-4e69-9de2-df5b256b0ba6":"976cf3fc-6935-4e69-9de2-df5b256b0ba6","e3c3ebce-f2c8-403d-9894-b22a4df7fd84":"e3c3ebce-f2c8-403d-9894-b22a4df7fd84","d8dbc425-be21-4f3a-beab-a37e6397e24f":"d8dbc425-be21-4f3a-beab-a37e6397e24f","79254c3c-4ce5-48b5-8292-26a89ab2e122":"79254c3c-4ce5-48b5-8292-26a89ab2e122"}	7d812252-ad98-434a-98af-ba059971b67f	2023-04-10 10:55:16.077+00	2023-04-10 11:29:57.434+00
23a0b052-1df7-4fa5-8505-49390371eab9	1681128963539-702792859.png	team testing 1	this is team for testing 1	https://gethype.page.link/5kaA	{"7d812252-ad98-434a-98af-ba059971b67f":"7d812252-ad98-434a-98af-ba059971b67f","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","48bb84ff-714f-4e7e-8172-359adfb1f13e":"48bb84ff-714f-4e7e-8172-359adfb1f13e","2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2":"2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2","929842c0-64eb-4369-96d1-306c4daf8f9d":"929842c0-64eb-4369-96d1-306c4daf8f9d","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43"}	7d812252-ad98-434a-98af-ba059971b67f	2023-04-10 12:13:46.29+00	2023-04-10 12:16:03.642+00
6fe73af9-eec2-4e94-b23b-3498e11f0de2	1680581783748-348729979.jpg	soccer team	this is for discussion of soccer team	https://gethype.page.link/1K1s	{"456b9492-371f-4b46-b627-92d50651e53b":"456b9492-371f-4b46-b627-92d50651e53b","b80adaef-78ae-4135-96d2-12ec481c758e":"b80adaef-78ae-4135-96d2-12ec481c758e","79254c3c-4ce5-48b5-8292-26a89ab2e122":"79254c3c-4ce5-48b5-8292-26a89ab2e122"}	456b9492-371f-4b46-b627-92d50651e53b	2023-04-04 04:15:10.881+00	2023-04-07 04:48:57.196+00
99ea433a-473b-4533-bbb5-fc6aaf3599fd	1681129092439-815831136.jpg	team testing 2	this is team for testing 2	https://gethype.page.link/JP5C	{"7d812252-ad98-434a-98af-ba059971b67f":"7d812252-ad98-434a-98af-ba059971b67f","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda","8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","929842c0-64eb-4369-96d1-306c4daf8f9d":"929842c0-64eb-4369-96d1-306c4daf8f9d","2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2":"2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2","48bb84ff-714f-4e7e-8172-359adfb1f13e":"48bb84ff-714f-4e7e-8172-359adfb1f13e","74ca1b0a-82f9-4852-b8da-c1b33181a997":"74ca1b0a-82f9-4852-b8da-c1b33181a997"}	7d812252-ad98-434a-98af-ba059971b67f	2023-04-10 12:17:25.837+00	2023-04-10 12:18:12.508+00
bdcb18eb-b9eb-4d41-98b8-5200dd572c16	1680845067281-62591589.png	my new team	this is for 	https://gethype.page.link/EJuB	{"456b9492-371f-4b46-b627-92d50651e53b":"456b9492-371f-4b46-b627-92d50651e53b","79254c3c-4ce5-48b5-8292-26a89ab2e122":"79254c3c-4ce5-48b5-8292-26a89ab2e122"}	456b9492-371f-4b46-b627-92d50651e53b	2023-04-07 05:24:23.767+00	2023-04-07 05:25:55.37+00
3fc6845e-7b34-4040-b662-7476cde02484	1681277332343-733761714.jpg	golf team morning batch	this team is for students and parents for morning batch	https://gethype.page.link/Q4rt	{"25e7261a-dd11-425c-b01a-5796cf7895c8":"25e7261a-dd11-425c-b01a-5796cf7895c8","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","ce6c69d7-0143-4d99-88b6-95f8f91c94b9":"ce6c69d7-0143-4d99-88b6-95f8f91c94b9"}	25e7261a-dd11-425c-b01a-5796cf7895c8	2023-04-12 05:28:50.962+00	2023-04-12 05:42:11.92+00
6f329eeb-b98c-4599-9855-b048812c8721	1680152046481-453289294.jpg	yx7t	6868r8yr55	https://gethype.page.link/ojcH	{"1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","1bd668c9-8c62-4e1e-b671-52d76a8efef6":"1bd668c9-8c62-4e1e-b671-52d76a8efef6","79254c3c-4ce5-48b5-8292-26a89ab2e122":"79254c3c-4ce5-48b5-8292-26a89ab2e122","c263d49b-1ced-4f29-b215-da96d141bc6b":"c263d49b-1ced-4f29-b215-da96d141bc6b","7f5b6fa9-e662-490b-819d-e10fdd790bda":"7f5b6fa9-e662-490b-819d-e10fdd790bda"}	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	2023-03-30 04:54:05.022+00	2023-04-10 07:28:52.624+00
8b8124b2-f045-439c-88e5-d6502ccb4f13	1686071659311-654553590.jpg	UCLA Bruins	Under 19 team división.	https://gethype.page.link/Wbe5	{"a3629d4e-f26f-43cb-9c3e-5461022ff427":"a3629d4e-f26f-43cb-9c3e-5461022ff427","f6b2b18e-e0fa-414f-b875-1e677074283f":"f6b2b18e-e0fa-414f-b875-1e677074283f"}	a3629d4e-f26f-43cb-9c3e-5461022ff427	2023-06-06 17:11:55.868+00	2023-06-06 17:14:19.367+00
6a5c5479-5af1-4bfc-b425-54ac6427016b	1690608929909-420681239.jpg	Team 2	chk	https://gethype.page.link/NaaV	{"10670a64-f419-48aa-b788-63ed4a3798a7":"10670a64-f419-48aa-b788-63ed4a3798a7"}	10670a64-f419-48aa-b788-63ed4a3798a7	2023-07-29 05:35:26.238+00	2023-07-29 05:35:29.923+00
f9f1a2b2-c28d-43b5-ae4f-780398387449	1690608957498-609679770.jpg	Team 3	The first one was the best I ever had in a while but it 	https://gethype.page.link/q9gD	{"10670a64-f419-48aa-b788-63ed4a3798a7":"10670a64-f419-48aa-b788-63ed4a3798a7"}	10670a64-f419-48aa-b788-63ed4a3798a7	2023-07-29 05:35:52.083+00	2023-07-29 05:35:57.509+00
51dccc5e-7775-472f-8bdf-fda5ed87905d	1697804908821-984915973.jpg	team 4	civkvlb. jcciddjxjccjcjc	https://gethype.page.link/xUm5	{"10670a64-f419-48aa-b788-63ed4a3798a7":"10670a64-f419-48aa-b788-63ed4a3798a7"}	10670a64-f419-48aa-b788-63ed4a3798a7	2023-07-29 05:36:20.846+00	2023-10-20 12:28:28.84+00
8faf7088-ad3c-48c6-a7bb-634fd0bb138d	1690609455289-320553338.jpg	team 1	Ghulam	https://gethype.page.link/MTPH	{"10670a64-f419-48aa-b788-63ed4a3798a7":"10670a64-f419-48aa-b788-63ed4a3798a7","8efe3d74-ce12-41da-b676-133a6c07dd43":"8efe3d74-ce12-41da-b676-133a6c07dd43","1d0d6d8d-1c4b-4a93-82a3-079a8a860518":"1d0d6d8d-1c4b-4a93-82a3-079a8a860518","929842c0-64eb-4369-96d1-306c4daf8f9d":"929842c0-64eb-4369-96d1-306c4daf8f9d","48bb84ff-714f-4e7e-8172-359adfb1f13e":"48bb84ff-714f-4e7e-8172-359adfb1f13e","9688397f-6b0a-4857-ba38-78d48f536ba3":"9688397f-6b0a-4857-ba38-78d48f536ba3","25e7261a-dd11-425c-b01a-5796cf7895c8":"25e7261a-dd11-425c-b01a-5796cf7895c8"}	10670a64-f419-48aa-b788-63ed4a3798a7	2023-07-29 05:35:04.002+00	2023-07-29 05:44:15.485+00
2ba90ca7-09e7-4eab-bd29-4b04ba104d39	1691056091870-77055547.jpg	team 12	testing team	https://gethype.page.link/FD5Z	{"10670a64-f419-48aa-b788-63ed4a3798a7":"10670a64-f419-48aa-b788-63ed4a3798a7"}	10670a64-f419-48aa-b788-63ed4a3798a7	2023-08-03 09:47:33.253+00	2023-08-03 09:48:11.925+00
630e7b0c-8de3-48e5-b67f-e38e88df4f4a	\N	Test Team 1	Soccer 1A 	https://gethype.page.link/4oLv	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","579ce8e1-3110-4035-814e-28e9a13e6ded":"579ce8e1-3110-4035-814e-28e9a13e6ded","68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3"}	579ce8e1-3110-4035-814e-28e9a13e6ded	2023-11-11 00:36:17.228+00	2023-11-11 00:39:20.494+00
917056f4-caf4-43b9-b95b-2e5fca8ebd87	1705365564636-686621614.png	Hype 	Hype	https://gethype.page.link/UCZe	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","b1413a4c-a009-47bf-b99e-1b03dab3ed2a":"b1413a4c-a009-47bf-b99e-1b03dab3ed2a"}	c1b1395e-c9fa-4de4-b148-07d032e5f763	2024-01-16 00:39:20.58+00	2024-03-07 18:05:45.386+00
ff106e34-2992-49c3-8296-a8b8a3d875c5	1695828126057-552110984.jpg	Eagles 	Boyle county flag football league 	https://gethype.page.link/jfmw	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3"}	c1b1395e-c9fa-4de4-b148-07d032e5f763	2023-09-27 15:21:57.792+00	2024-01-16 00:34:12.287+00
bf91474d-129e-449b-98e8-8082af726ba3	\N	Goats 	Black Team	https://gethype.page.link/XjiW	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3","579ce8e1-3110-4035-814e-28e9a13e6ded":"579ce8e1-3110-4035-814e-28e9a13e6ded","f55f9574-5100-4cda-b9bf-49811b672031":"f55f9574-5100-4cda-b9bf-49811b672031","228f909e-70d1-4b69-bae8-6f72cfee94aa":"228f909e-70d1-4b69-bae8-6f72cfee94aa","ea23f13c-917c-4329-8344-2964aa418129":"ea23f13c-917c-4329-8344-2964aa418129"}	c1b1395e-c9fa-4de4-b148-07d032e5f763	2023-09-07 19:58:27.904+00	2023-10-01 14:43:52.807+00
2bb721d4-8eed-492e-91a1-580e6946b703	\N	test 2	\N	https://gethype.page.link/qLfU	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","17caaa25-81bd-4379-acc9-13f67e9d6fa7":"17caaa25-81bd-4379-acc9-13f67e9d6fa7","bbf6c7ba-efb8-47c0-bfaf-bb76cb3d052f":"bbf6c7ba-efb8-47c0-bfaf-bb76cb3d052f","e5cd573c-e1d8-471f-99b6-c69260365ea2":"e5cd573c-e1d8-471f-99b6-c69260365ea2"}	c1b1395e-c9fa-4de4-b148-07d032e5f763	2024-03-11 16:45:46.225+00	2024-03-11 18:56:42.056+00
dd4e06d2-986e-451d-a750-64f2b335dbb4	\N	Hype 2	Basketball 	https://gethype.page.link/DK81	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3","82eeaa00-4577-43eb-8509-f126179b2b56":"82eeaa00-4577-43eb-8509-f126179b2b56","e650763e-d8cd-48b8-a978-b12adbf159c4":"e650763e-d8cd-48b8-a978-b12adbf159c4"}	c1b1395e-c9fa-4de4-b148-07d032e5f763	2024-01-24 00:46:42.281+00	2024-01-24 01:06:20.848+00
f4aa8d76-b4eb-4ed8-9226-3619cfad0c43	\N	Reds 	Baseball	https://gethype.page.link/ae24	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","68c0b5c1-b74e-4cad-a3f3-b2a534a463e3":"68c0b5c1-b74e-4cad-a3f3-b2a534a463e3"}	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	2023-10-24 12:00:00.702+00	2023-10-24 12:01:35.023+00
f80b272c-6a52-4e83-afea-03e7c130737a	\N	Jaybirds	Middle School ATeam	https://gethype.page.link/JHGa	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	c1b1395e-c9fa-4de4-b148-07d032e5f763	2023-10-06 02:53:02.187+00	2023-10-27 12:07:17.155+00
61ddd332-42eb-4858-8e89-c6dbaf2f61c0	1707811704739-130005326.jpg	st George	\N	https://gethype.page.link/NhtJ	{"17caaa25-81bd-4379-acc9-13f67e9d6fa7":"17caaa25-81bd-4379-acc9-13f67e9d6fa7","3ff87fa1-3b13-48dd-9984-95ff58d3ed7b":"3ff87fa1-3b13-48dd-9984-95ff58d3ed7b","c9c1f395-a9f3-4e4d-a7e4-18db8b692aa5":"c9c1f395-a9f3-4e4d-a7e4-18db8b692aa5"}	17caaa25-81bd-4379-acc9-13f67e9d6fa7	2024-02-13 08:08:11.696+00	2024-03-07 17:05:07.765+00
e0f02e39-ec0c-44bf-a04a-acee1ef1b0be	\N	Test	Test	https://gethype.page.link/7EQq	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763","02d196ee-604d-4b60-9baf-5dc28483a43c":"02d196ee-604d-4b60-9baf-5dc28483a43c","b1413a4c-a009-47bf-b99e-1b03dab3ed2a":"b1413a4c-a009-47bf-b99e-1b03dab3ed2a"}	c1b1395e-c9fa-4de4-b148-07d032e5f763	2023-10-06 02:46:29.381+00	2024-03-07 17:56:04.505+00
252d0b5c-041d-434c-b4a8-53b0f864483a	\N	team3	\N	https://gethype.page.link/xWcx	{"c1b1395e-c9fa-4de4-b148-07d032e5f763":"c1b1395e-c9fa-4de4-b148-07d032e5f763"}	c1b1395e-c9fa-4de4-b148-07d032e5f763	2024-03-11 18:59:21.59+00	2024-03-12 18:30:53.925+00
\.


--
-- Data for Name: tennis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tennis (id, "gameName", aces, "breakPoints", "doubleFaults", "servePercentage", "winnersName", "matchTime", "pointsWon", "servicePointsWon", "setsWon", "receivingPointsWon", "playErrors", "matchStatus", score, "userId", date, "createdAt", "updatedAt") FROM stdin;
dc18ab82-4749-4534-a529-ff8ec0494274	demo game 1	11	12	13	14.00	Admin	15	16	17	18	19	20	1	21	dac88882-c1c5-4855-b0e5-56492ef89f08	2023-04-27	2023-04-29 07:58:25.795+00	2023-04-29 07:58:25.795+00
\.


--
-- Data for Name: userPermissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."userPermissions" ("userId", modules, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: userTeams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."userTeams" (id, "userId", teams, "createdAt", "updatedAt") FROM stdin;
6ab92cbf-14aa-4dcd-a199-4e20953532e5	79254c3c-4ce5-48b5-8292-26a89ab2e122	{"6fe73af9-eec2-4e94-b23b-3498e11f0de2":"6fe73af9-eec2-4e94-b23b-3498e11f0de2","bdcb18eb-b9eb-4d41-98b8-5200dd572c16":"bdcb18eb-b9eb-4d41-98b8-5200dd572c16","23dbe06a-9d56-4937-be51-1d80ac021151":"23dbe06a-9d56-4937-be51-1d80ac021151","6f329eeb-b98c-4599-9855-b048812c8721":"6f329eeb-b98c-4599-9855-b048812c8721","79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558"}	2023-04-04 05:05:00.226+00	2023-04-10 11:29:57.431+00
28811794-7fa9-4d22-b522-4e82acb466a4	2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2	{"79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558","23a0b052-1df7-4fa5-8505-49390371eab9":"23a0b052-1df7-4fa5-8505-49390371eab9","99ea433a-473b-4533-bbb5-fc6aaf3599fd":"99ea433a-473b-4533-bbb5-fc6aaf3599fd"}	2023-04-10 10:57:30.092+00	2023-04-10 12:18:12.493+00
1cb9ff40-7eef-46ed-a16e-b1e42df49a62	74ca1b0a-82f9-4852-b8da-c1b33181a997	{"79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558","99ea433a-473b-4533-bbb5-fc6aaf3599fd":"99ea433a-473b-4533-bbb5-fc6aaf3599fd"}	2023-04-10 10:57:30.15+00	2023-04-10 12:18:12.505+00
edc9a444-87d3-4241-9368-719f16ce9e26	d0247d36-982d-4d82-b552-c28338bcc67c	{"23dbe06a-9d56-4937-be51-1d80ac021151":"23dbe06a-9d56-4937-be51-1d80ac021151"}	2023-04-11 11:08:53.701+00	2023-04-11 11:08:53.713+00
c6d6bccf-68f7-40f5-ae3e-3b47797e3076	7d812252-ad98-434a-98af-ba059971b67f	{"79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558","23a0b052-1df7-4fa5-8505-49390371eab9":"23a0b052-1df7-4fa5-8505-49390371eab9","99ea433a-473b-4533-bbb5-fc6aaf3599fd":"99ea433a-473b-4533-bbb5-fc6aaf3599fd"}	2023-04-10 10:55:16.096+00	2023-04-10 12:17:25.847+00
1edfb036-ed9a-43f0-89dd-09ece8b64415	7f5b6fa9-e662-490b-819d-e10fdd790bda	{"6f329eeb-b98c-4599-9855-b048812c8721":"6f329eeb-b98c-4599-9855-b048812c8721","79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558","23a0b052-1df7-4fa5-8505-49390371eab9":"23a0b052-1df7-4fa5-8505-49390371eab9","99ea433a-473b-4533-bbb5-fc6aaf3599fd":"99ea433a-473b-4533-bbb5-fc6aaf3599fd"}	2023-04-10 07:28:52.612+00	2023-04-10 12:18:12.461+00
caf0a649-0dc1-474b-86a2-2ffb7b16e997	456b9492-371f-4b46-b627-92d50651e53b	{"6fe73af9-eec2-4e94-b23b-3498e11f0de2":"6fe73af9-eec2-4e94-b23b-3498e11f0de2","bdcb18eb-b9eb-4d41-98b8-5200dd572c16":"bdcb18eb-b9eb-4d41-98b8-5200dd572c16"}	2023-04-04 04:15:10.889+00	2023-04-07 05:24:23.783+00
0c768d18-f797-47a5-a506-156c0b3ac4a4	dac88882-c1c5-4855-b0e5-56492ef89f08	{"79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558"}	2023-04-10 10:57:30.167+00	2023-04-10 10:57:30.177+00
ec0def0c-7d24-4ae6-93d1-1f85c7379799	976cf3fc-6935-4e69-9de2-df5b256b0ba6	{"79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558"}	2023-04-10 10:57:30.182+00	2023-04-10 10:57:30.193+00
f7044191-5d45-4786-bddb-61deab7606fb	e3c3ebce-f2c8-403d-9894-b22a4df7fd84	{"79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558"}	2023-04-10 10:57:30.199+00	2023-04-10 10:57:30.205+00
22165fdd-7dda-465c-9d57-7327c3b9e69b	d8dbc425-be21-4f3a-beab-a37e6397e24f	{"79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558"}	2023-04-10 10:57:30.218+00	2023-04-10 10:57:30.223+00
6d70258c-38aa-4a0d-a40f-5beafa0f21d9	a3629d4e-f26f-43cb-9c3e-5461022ff427	{"8b8124b2-f045-439c-88e5-d6502ccb4f13":"8b8124b2-f045-439c-88e5-d6502ccb4f13"}	2023-06-06 17:11:55.876+00	2023-06-06 17:11:55.884+00
5b71afc7-c95e-4f59-81d2-9489083ebbb6	f6b2b18e-e0fa-414f-b875-1e677074283f	{"8b8124b2-f045-439c-88e5-d6502ccb4f13":"8b8124b2-f045-439c-88e5-d6502ccb4f13"}	2023-06-06 17:14:19.354+00	2023-06-06 17:14:19.362+00
f4016fb8-01a5-4435-9cc7-70120a65b6fc	929842c0-64eb-4369-96d1-306c4daf8f9d	{"79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558","23a0b052-1df7-4fa5-8505-49390371eab9":"23a0b052-1df7-4fa5-8505-49390371eab9","99ea433a-473b-4533-bbb5-fc6aaf3599fd":"99ea433a-473b-4533-bbb5-fc6aaf3599fd","8faf7088-ad3c-48c6-a7bb-634fd0bb138d":"8faf7088-ad3c-48c6-a7bb-634fd0bb138d"}	2023-04-10 10:57:30.071+00	2023-07-29 05:44:15.413+00
aa5b5963-51c6-4353-95aa-1de847b71d5b	48bb84ff-714f-4e7e-8172-359adfb1f13e	{"79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558","23a0b052-1df7-4fa5-8505-49390371eab9":"23a0b052-1df7-4fa5-8505-49390371eab9","99ea433a-473b-4533-bbb5-fc6aaf3599fd":"99ea433a-473b-4533-bbb5-fc6aaf3599fd","8faf7088-ad3c-48c6-a7bb-634fd0bb138d":"8faf7088-ad3c-48c6-a7bb-634fd0bb138d"}	2023-04-10 10:57:30.116+00	2023-07-29 05:44:15.455+00
86773a57-b2f7-48e8-827c-9efc808e4aee	9688397f-6b0a-4857-ba38-78d48f536ba3	{"79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558","8faf7088-ad3c-48c6-a7bb-634fd0bb138d":"8faf7088-ad3c-48c6-a7bb-634fd0bb138d"}	2023-04-10 10:57:30.139+00	2023-07-29 05:44:15.464+00
84333281-4e11-4f77-88f8-9e8df01fd666	25e7261a-dd11-425c-b01a-5796cf7895c8	{"3fc6845e-7b34-4040-b662-7476cde02484":"3fc6845e-7b34-4040-b662-7476cde02484","8faf7088-ad3c-48c6-a7bb-634fd0bb138d":"8faf7088-ad3c-48c6-a7bb-634fd0bb138d"}	2023-04-12 05:28:50.971+00	2023-07-29 05:44:15.473+00
ad8ab780-cb33-402f-b49c-1fd70d7ce379	8efe3d74-ce12-41da-b676-133a6c07dd43	{"666a063c-b977-4f2e-a93f-35a78f5bb7c2":"666a063c-b977-4f2e-a93f-35a78f5bb7c2","79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558","23a0b052-1df7-4fa5-8505-49390371eab9":"23a0b052-1df7-4fa5-8505-49390371eab9","99ea433a-473b-4533-bbb5-fc6aaf3599fd":"99ea433a-473b-4533-bbb5-fc6aaf3599fd","8faf7088-ad3c-48c6-a7bb-634fd0bb138d":"8faf7088-ad3c-48c6-a7bb-634fd0bb138d"}	2023-03-29 10:43:32.409+00	2023-07-29 05:44:15.379+00
937f5064-1449-4e7b-b082-c9ec675814ad	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	{"6f329eeb-b98c-4599-9855-b048812c8721":"6f329eeb-b98c-4599-9855-b048812c8721","23dbe06a-9d56-4937-be51-1d80ac021151":"23dbe06a-9d56-4937-be51-1d80ac021151","79859e57-421b-46d0-816e-eb3f5bfb2558":"79859e57-421b-46d0-816e-eb3f5bfb2558","23a0b052-1df7-4fa5-8505-49390371eab9":"23a0b052-1df7-4fa5-8505-49390371eab9","99ea433a-473b-4533-bbb5-fc6aaf3599fd":"99ea433a-473b-4533-bbb5-fc6aaf3599fd","8faf7088-ad3c-48c6-a7bb-634fd0bb138d":"8faf7088-ad3c-48c6-a7bb-634fd0bb138d"}	2023-03-30 04:54:05.031+00	2023-07-29 05:44:15.389+00
b5f0137e-672b-462f-9ca0-ca3e4b33267a	10670a64-f419-48aa-b788-63ed4a3798a7	{"8faf7088-ad3c-48c6-a7bb-634fd0bb138d":"8faf7088-ad3c-48c6-a7bb-634fd0bb138d","6a5c5479-5af1-4bfc-b425-54ac6427016b":"6a5c5479-5af1-4bfc-b425-54ac6427016b","f9f1a2b2-c28d-43b5-ae4f-780398387449":"f9f1a2b2-c28d-43b5-ae4f-780398387449","51dccc5e-7775-472f-8bdf-fda5ed87905d":"51dccc5e-7775-472f-8bdf-fda5ed87905d","2ba90ca7-09e7-4eab-bd29-4b04ba104d39":"2ba90ca7-09e7-4eab-bd29-4b04ba104d39"}	2023-07-29 05:35:04.011+00	2023-08-03 09:47:33.27+00
bbb78637-edff-4172-88ba-65ee5a40dc87	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	{"bf91474d-129e-449b-98e8-8082af726ba3":"bf91474d-129e-449b-98e8-8082af726ba3","f4aa8d76-b4eb-4ed8-9226-3619cfad0c43":"f4aa8d76-b4eb-4ed8-9226-3619cfad0c43","630e7b0c-8de3-48e5-b67f-e38e88df4f4a":"630e7b0c-8de3-48e5-b67f-e38e88df4f4a","ff106e34-2992-49c3-8296-a8b8a3d875c5":"ff106e34-2992-49c3-8296-a8b8a3d875c5","dd4e06d2-986e-451d-a750-64f2b335dbb4":"dd4e06d2-986e-451d-a750-64f2b335dbb4"}	2023-09-27 14:11:03.11+00	2024-01-24 01:01:33.14+00
52ab4bc8-52fd-4188-b5d7-10ac01c1d591	f55f9574-5100-4cda-b9bf-49811b672031	{"bf91474d-129e-449b-98e8-8082af726ba3":"bf91474d-129e-449b-98e8-8082af726ba3"}	2023-09-27 14:27:55.878+00	2023-10-27 12:07:17.164+00
f8bfc996-0f42-4b0d-84b5-4e21f34a926b	228f909e-70d1-4b69-bae8-6f72cfee94aa	{"bf91474d-129e-449b-98e8-8082af726ba3":"bf91474d-129e-449b-98e8-8082af726ba3"}	2023-09-27 14:28:06.319+00	2023-09-27 14:28:06.323+00
8eac3f28-96c7-4a31-960b-f72ee430b0b4	579ce8e1-3110-4035-814e-28e9a13e6ded	{"bf91474d-129e-449b-98e8-8082af726ba3":"bf91474d-129e-449b-98e8-8082af726ba3","630e7b0c-8de3-48e5-b67f-e38e88df4f4a":"630e7b0c-8de3-48e5-b67f-e38e88df4f4a"}	2023-09-27 14:11:16.683+00	2023-11-11 00:37:02.253+00
35cf17ac-6b13-4058-a21d-23b4b7b71576	82eeaa00-4577-43eb-8509-f126179b2b56	{"dd4e06d2-986e-451d-a750-64f2b335dbb4":"dd4e06d2-986e-451d-a750-64f2b335dbb4"}	2024-01-24 01:04:19.924+00	2024-01-24 01:04:19.931+00
3c67885d-f248-45dd-9943-02f62729089d	e650763e-d8cd-48b8-a978-b12adbf159c4	{"dd4e06d2-986e-451d-a750-64f2b335dbb4":"dd4e06d2-986e-451d-a750-64f2b335dbb4"}	2024-01-24 01:06:20.837+00	2024-01-24 01:06:20.845+00
91fd8428-9fc3-4f57-b4a6-2894d7b35271	c9c1f395-a9f3-4e4d-a7e4-18db8b692aa5	{"61ddd332-42eb-4858-8e89-c6dbaf2f61c0":"61ddd332-42eb-4858-8e89-c6dbaf2f61c0"}	2024-03-06 17:35:24.882+00	2024-03-06 17:35:24.891+00
14e1c8b8-a12d-4e94-8f2a-b372f212dfac	c1b1395e-c9fa-4de4-b148-07d032e5f763	{"bf91474d-129e-449b-98e8-8082af726ba3":"bf91474d-129e-449b-98e8-8082af726ba3","ff106e34-2992-49c3-8296-a8b8a3d875c5":"ff106e34-2992-49c3-8296-a8b8a3d875c5","e0f02e39-ec0c-44bf-a04a-acee1ef1b0be":"e0f02e39-ec0c-44bf-a04a-acee1ef1b0be","f80b272c-6a52-4e83-afea-03e7c130737a":"f80b272c-6a52-4e83-afea-03e7c130737a","f4aa8d76-b4eb-4ed8-9226-3619cfad0c43":"f4aa8d76-b4eb-4ed8-9226-3619cfad0c43","630e7b0c-8de3-48e5-b67f-e38e88df4f4a":"630e7b0c-8de3-48e5-b67f-e38e88df4f4a","917056f4-caf4-43b9-b95b-2e5fca8ebd87":"917056f4-caf4-43b9-b95b-2e5fca8ebd87","dd4e06d2-986e-451d-a750-64f2b335dbb4":"dd4e06d2-986e-451d-a750-64f2b335dbb4","2bb721d4-8eed-492e-91a1-580e6946b703":"2bb721d4-8eed-492e-91a1-580e6946b703","252d0b5c-041d-434c-b4a8-53b0f864483a":"252d0b5c-041d-434c-b4a8-53b0f864483a"}	2023-09-07 19:58:27.912+00	2024-03-11 18:59:21.598+00
efb74960-7afd-41db-9425-65cbf484c4fd	3ff87fa1-3b13-48dd-9984-95ff58d3ed7b	{"61ddd332-42eb-4858-8e89-c6dbaf2f61c0":"61ddd332-42eb-4858-8e89-c6dbaf2f61c0"}	2024-03-06 17:07:41.025+00	2024-03-07 17:05:07.758+00
847695f2-41f3-4a67-a245-7cf42df1b9cb	b1413a4c-a009-47bf-b99e-1b03dab3ed2a	{"e0f02e39-ec0c-44bf-a04a-acee1ef1b0be":"e0f02e39-ec0c-44bf-a04a-acee1ef1b0be","917056f4-caf4-43b9-b95b-2e5fca8ebd87":"917056f4-caf4-43b9-b95b-2e5fca8ebd87"}	2024-03-07 17:56:04.422+00	2024-03-07 18:05:45.383+00
261d0142-7faf-494e-9fcd-cd6ce52546d9	17caaa25-81bd-4379-acc9-13f67e9d6fa7	{"61ddd332-42eb-4858-8e89-c6dbaf2f61c0":"61ddd332-42eb-4858-8e89-c6dbaf2f61c0","2bb721d4-8eed-492e-91a1-580e6946b703":"2bb721d4-8eed-492e-91a1-580e6946b703"}	2024-02-13 08:08:11.705+00	2024-03-11 16:55:06.592+00
c9d2cd11-5d4f-4926-88d2-4a07d000df75	bbf6c7ba-efb8-47c0-bfaf-bb76cb3d052f	{"2bb721d4-8eed-492e-91a1-580e6946b703":"2bb721d4-8eed-492e-91a1-580e6946b703"}	2024-03-11 16:58:51.328+00	2024-03-11 17:12:03.18+00
f411ceb1-5e45-4913-9e7b-90428b09ed48	02d196ee-604d-4b60-9baf-5dc28483a43c	{"e0f02e39-ec0c-44bf-a04a-acee1ef1b0be":"e0f02e39-ec0c-44bf-a04a-acee1ef1b0be"}	2024-03-07 17:47:14.435+00	2024-03-12 18:30:53.93+00
ffc5ef1c-5a0e-4342-948a-fc193da64bfc	e5cd573c-e1d8-471f-99b6-c69260365ea2	{"2bb721d4-8eed-492e-91a1-580e6946b703":"2bb721d4-8eed-492e-91a1-580e6946b703"}	2024-03-11 18:06:02.006+00	2024-03-11 18:06:02.015+00
\.


--
-- Data for Name: usergroupdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usergroupdetails (id, "userId", "groupList", "createdAt", "updatedAt") FROM stdin;
42c530f2-c78b-49de-ba6e-0c6eb1b79db4	79254c3c-4ce5-48b5-8292-26a89ab2e122	{"6ff10ec6-c23d-4676-b2cf-1bcd35a0800a":"6ff10ec6-c23d-4676-b2cf-1bcd35a0800a"}	2023-04-07 06:25:42.602+00	2023-04-07 06:25:42.62+00
5674f9c2-88f1-4536-b4ca-9a902ceafdc1	1d0d6d8d-1c4b-4a93-82a3-079a8a860518	{"f90b554f-a4e3-43b5-b622-69853a1f73f1":"f90b554f-a4e3-43b5-b622-69853a1f73f1","e69c7197-a1a8-4bf5-a91d-a74c9ca847a9":"e69c7197-a1a8-4bf5-a91d-a74c9ca847a9"}	2023-04-05 06:26:25.758+00	2023-04-11 10:05:18.571+00
3b65afc0-1c0b-4cbd-8c5d-d969abe7e82e	579ce8e1-3110-4035-814e-28e9a13e6ded	{"82a7b283-9cda-484b-8de1-11f0db950ff5":"82a7b283-9cda-484b-8de1-11f0db950ff5","5a0edfdc-a079-4e29-86e0-ac534e81f38b":"5a0edfdc-a079-4e29-86e0-ac534e81f38b","a42e4019-860a-452c-a065-1984bc132579":"a42e4019-860a-452c-a065-1984bc132579"}	2023-09-02 06:18:11.221+00	2023-10-24 14:17:02.604+00
e1785aeb-50c7-48d4-a37e-e92e29f409dc	10670a64-f419-48aa-b788-63ed4a3798a7	{"4d15f55a-fca2-483b-9d5e-03a7bfb13308":"4d15f55a-fca2-483b-9d5e-03a7bfb13308"}	2023-08-03 09:40:36.684+00	2023-08-03 09:40:36.704+00
62fb7879-e72e-44fb-a200-4fffa0718562	929842c0-64eb-4369-96d1-306c4daf8f9d	{"8570e857-819c-4a1f-831b-72f90a2059ec":"8570e857-819c-4a1f-831b-72f90a2059ec"}	2023-08-17 05:41:33.017+00	2023-08-17 05:41:33.029+00
2e0d66dd-af6f-4c26-8d3d-168ef67b11aa	25e7261a-dd11-425c-b01a-5796cf7895c8	{"43f8a619-acb4-40a5-a590-e64bef3dfa97":"43f8a619-acb4-40a5-a590-e64bef3dfa97","82a7b283-9cda-484b-8de1-11f0db950ff5":"82a7b283-9cda-484b-8de1-11f0db950ff5"}	2023-04-12 08:39:18.328+00	2023-09-02 06:18:11.192+00
c1dd8f68-690c-4998-8b9b-efd65a451161	82eeaa00-4577-43eb-8509-f126179b2b56	{"898100a9-d3b5-470d-acf5-8f5ad9b260d0":"898100a9-d3b5-470d-acf5-8f5ad9b260d0"}	2024-01-24 01:25:04.018+00	2024-01-24 01:25:04.025+00
7b60fc04-8c82-43c4-afc7-d8312e159cf3	74ca1b0a-82f9-4852-b8da-c1b33181a997	{"e69c7197-a1a8-4bf5-a91d-a74c9ca847a9":"e69c7197-a1a8-4bf5-a91d-a74c9ca847a9","4d15f55a-fca2-483b-9d5e-03a7bfb13308":"4d15f55a-fca2-483b-9d5e-03a7bfb13308","82a7b283-9cda-484b-8de1-11f0db950ff5":"82a7b283-9cda-484b-8de1-11f0db950ff5"}	2023-04-11 11:38:03.453+00	2023-09-02 06:18:11.237+00
7ab26605-c186-4c44-a4db-5fcaa065c6ad	7f5b6fa9-e662-490b-819d-e10fdd790bda	{"e69c7197-a1a8-4bf5-a91d-a74c9ca847a9":"e69c7197-a1a8-4bf5-a91d-a74c9ca847a9","82a7b283-9cda-484b-8de1-11f0db950ff5":"82a7b283-9cda-484b-8de1-11f0db950ff5"}	2023-04-11 10:05:18.506+00	2023-09-02 06:18:11.242+00
f1709aa2-8b70-4d72-90e1-4eb26a40137b	d8dbc425-be21-4f3a-beab-a37e6397e24f	{"82a7b283-9cda-484b-8de1-11f0db950ff5":"82a7b283-9cda-484b-8de1-11f0db950ff5"}	2023-09-02 06:18:11.253+00	2023-09-02 06:18:11.256+00
4738e00d-82c1-436a-9df4-bbebc97338e8	b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	{"12fa232c-7bd4-4d83-a283-a0f1489e5185":"12fa232c-7bd4-4d83-a283-a0f1489e5185","2b052cc9-78bb-4fe3-86d0-0ce805f4f563":"2b052cc9-78bb-4fe3-86d0-0ce805f4f563"}	2023-08-17 06:44:14.686+00	2023-08-17 06:46:08.392+00
799d73f1-9673-4e14-8ebc-320d0e96d62a	48bb84ff-714f-4e7e-8172-359adfb1f13e	{"8570e857-819c-4a1f-831b-72f90a2059ec":"8570e857-819c-4a1f-831b-72f90a2059ec","82a7b283-9cda-484b-8de1-11f0db950ff5":"82a7b283-9cda-484b-8de1-11f0db950ff5"}	2023-08-17 05:41:33.06+00	2023-09-02 06:18:11.261+00
7277766e-0087-4275-a3fa-6a99b8a1ae1d	9688397f-6b0a-4857-ba38-78d48f536ba3	{"43f8a619-acb4-40a5-a590-e64bef3dfa97":"43f8a619-acb4-40a5-a590-e64bef3dfa97","4d15f55a-fca2-483b-9d5e-03a7bfb13308":"4d15f55a-fca2-483b-9d5e-03a7bfb13308","82a7b283-9cda-484b-8de1-11f0db950ff5":"82a7b283-9cda-484b-8de1-11f0db950ff5"}	2023-04-12 08:39:18.273+00	2023-09-02 06:18:11.267+00
6418598d-97b2-4a75-91ea-bf73f30f2d56	d0247d36-982d-4d82-b552-c28338bcc67c	{"e69c7197-a1a8-4bf5-a91d-a74c9ca847a9":"e69c7197-a1a8-4bf5-a91d-a74c9ca847a9","8570e857-819c-4a1f-831b-72f90a2059ec":"8570e857-819c-4a1f-831b-72f90a2059ec","12fa232c-7bd4-4d83-a283-a0f1489e5185":"12fa232c-7bd4-4d83-a283-a0f1489e5185","2b052cc9-78bb-4fe3-86d0-0ce805f4f563":"2b052cc9-78bb-4fe3-86d0-0ce805f4f563"}	2023-04-11 10:05:18.535+00	2023-08-17 06:46:08.443+00
acfb0f7e-e13a-461e-8af2-bde5453bc8f5	dac88882-c1c5-4855-b0e5-56492ef89f08	{"43f8a619-acb4-40a5-a590-e64bef3dfa97":"43f8a619-acb4-40a5-a590-e64bef3dfa97","82a7b283-9cda-484b-8de1-11f0db950ff5":"82a7b283-9cda-484b-8de1-11f0db950ff5"}	2023-04-12 08:39:18.288+00	2023-09-02 06:18:11.272+00
abdbb73e-f107-43d9-8614-1917cc99873c	576a1e23-df24-452d-ba2a-b06c7a6a8f4c	{"2b052cc9-78bb-4fe3-86d0-0ce805f4f563":"2b052cc9-78bb-4fe3-86d0-0ce805f4f563"}	2023-08-17 06:44:14.647+00	2023-08-17 07:05:07.289+00
16c929dd-39a6-4310-bd75-b48a7e4a932c	2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2	{"d94a2450-45ca-4b8f-9a15-b6d221baada5":"d94a2450-45ca-4b8f-9a15-b6d221baada5"}	2023-09-02 06:11:02.942+00	2023-09-02 06:11:02.949+00
0809631f-130c-4abd-9e5c-15f1e9e7414b	8efe3d74-ce12-41da-b676-133a6c07dd43	{"f90b554f-a4e3-43b5-b622-69853a1f73f1":"f90b554f-a4e3-43b5-b622-69853a1f73f1","d94a2450-45ca-4b8f-9a15-b6d221baada5":"d94a2450-45ca-4b8f-9a15-b6d221baada5"}	2023-04-05 06:26:25.657+00	2023-09-02 06:11:02.971+00
9a636e48-32d3-4829-b4aa-4ae8640d4fc0	f6b2b18e-e0fa-414f-b875-1e677074283f	{"82a7b283-9cda-484b-8de1-11f0db950ff5":"82a7b283-9cda-484b-8de1-11f0db950ff5"}	2023-09-02 06:18:11.141+00	2023-09-02 06:18:11.146+00
aecf1a52-9593-4dfd-bf36-a0c8fb3f60fb	2b6aa620-df6c-43a6-92c6-1e4b3de4706b	{"12fa232c-7bd4-4d83-a283-a0f1489e5185":"12fa232c-7bd4-4d83-a283-a0f1489e5185","2b052cc9-78bb-4fe3-86d0-0ce805f4f563":"2b052cc9-78bb-4fe3-86d0-0ce805f4f563","82a7b283-9cda-484b-8de1-11f0db950ff5":"82a7b283-9cda-484b-8de1-11f0db950ff5"}	2023-08-17 06:44:14.672+00	2023-09-02 06:18:11.165+00
dec1d196-a59d-447f-8711-8f9d9c692cfb	9d5a2086-fc35-49ac-ade4-8690a88db24c	{"8570e857-819c-4a1f-831b-72f90a2059ec":"8570e857-819c-4a1f-831b-72f90a2059ec","12fa232c-7bd4-4d83-a283-a0f1489e5185":"12fa232c-7bd4-4d83-a283-a0f1489e5185","2b052cc9-78bb-4fe3-86d0-0ce805f4f563":"2b052cc9-78bb-4fe3-86d0-0ce805f4f563","d94a2450-45ca-4b8f-9a15-b6d221baada5":"d94a2450-45ca-4b8f-9a15-b6d221baada5","82a7b283-9cda-484b-8de1-11f0db950ff5":"82a7b283-9cda-484b-8de1-11f0db950ff5"}	2023-08-17 05:41:33.081+00	2023-09-02 06:18:11.277+00
a133a564-8c19-4f91-aa99-8453db5919b5	e650763e-d8cd-48b8-a978-b12adbf159c4	{"898100a9-d3b5-470d-acf5-8f5ad9b260d0":"898100a9-d3b5-470d-acf5-8f5ad9b260d0"}	2024-01-24 01:25:04.03+00	2024-01-24 01:25:04.033+00
a470dbdd-f896-4197-bd7a-a0fd18f2227a	68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	{"5a0edfdc-a079-4e29-86e0-ac534e81f38b":"5a0edfdc-a079-4e29-86e0-ac534e81f38b","a42e4019-860a-452c-a065-1984bc132579":"a42e4019-860a-452c-a065-1984bc132579"}	2023-09-27 14:14:26.815+00	2023-10-24 14:17:02.571+00
db485945-8097-4ec0-a507-5d0dc356fed6	c1b1395e-c9fa-4de4-b148-07d032e5f763	{"5a0edfdc-a079-4e29-86e0-ac534e81f38b":"5a0edfdc-a079-4e29-86e0-ac534e81f38b","a42e4019-860a-452c-a065-1984bc132579":"a42e4019-860a-452c-a065-1984bc132579","898100a9-d3b5-470d-acf5-8f5ad9b260d0":"898100a9-d3b5-470d-acf5-8f5ad9b260d0"}	2023-09-27 14:14:26.826+00	2024-01-24 01:25:04.038+00
b28edd95-0026-4a97-96ed-e7172cec9675	3ff87fa1-3b13-48dd-9984-95ff58d3ed7b	{"327acc88-8f96-4c83-a3c7-6602e7132b0a":"327acc88-8f96-4c83-a3c7-6602e7132b0a"}	2024-03-06 18:39:58.98+00	2024-03-06 18:39:58.988+00
6a94139b-8061-42d9-abc7-f54420bbac12	c9c1f395-a9f3-4e4d-a7e4-18db8b692aa5	{"327acc88-8f96-4c83-a3c7-6602e7132b0a":"327acc88-8f96-4c83-a3c7-6602e7132b0a"}	2024-03-06 18:39:59.002+00	2024-03-06 18:39:59.017+00
40c45020-8e7c-4293-8938-c924aac3ebb6	17caaa25-81bd-4379-acc9-13f67e9d6fa7	{"327acc88-8f96-4c83-a3c7-6602e7132b0a":"327acc88-8f96-4c83-a3c7-6602e7132b0a"}	2024-03-06 18:39:59.026+00	2024-03-06 18:39:59.034+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, fullname, email, password, signupvia, otp, otpvalid, gender, age, "profileImagePath", "sportId", "roleId", status, "allowLocation", "referralCode", university, "isAdmin", "createdAt", "updatedAt") FROM stdin;
8efe3d74-ce12-41da-b676-133a6c07dd43	coach sachin	neget37638@duiter.com	$2b$10$/CF/NKc94YzPSOnHbdPh2urECXPAoEyS8cyyAN6Fe7huXFT5dBT7m	1	5836	2023-03-29 16:14:41+00	1	25	\N	2	2	t	t	p93dn9y95y	university College of London 	f	2023-03-29 10:41:41.636+00	2023-03-29 10:41:41.636+00
79254c3c-4ce5-48b5-8292-26a89ab2e122	Xcode Themes	xcodethemes9@gmail.com	\N	2	1840	2023-04-04 09:59:51+00	1	15	1681126234650-815478589.jpg	1	1	t	t	bitn4oqcet	the best 	f	2023-04-04 04:26:51.587+00	2023-04-10 11:30:34.671+00
1d0d6d8d-1c4b-4a93-82a3-079a8a860518	coach 0000	tehiv63482@cyclesat.com	$2b$10$v90NUTiX5y7EHd/1nAViJObU1wj5sZeFXSz9szR.GG/vQRBKz0tVe	1	1399	2023-03-30 10:52:55+00	1	25	\N	2	2	t	t	3fduxjzj3j	oufiyfiydiydi0tis7tsu ohdyifyi	f	2023-03-30 04:48:15.876+00	2023-03-30 05:20:45.55+00
456b9492-371f-4b46-b627-92d50651e53b	xcode themes	xcodethemes.test438@gmail.com	\N	3	4176	2023-03-30 11:06:23+00	0	25	1680581152267-354944817.jpg	7	2	t	t	9wxhkljm6y	fgkx cncnc juo	f	2023-03-30 05:33:23.835+00	2023-04-04 04:05:52.273+00
929842c0-64eb-4369-96d1-306c4daf8f9d	xcodethemes harshank	xcodethemesharshank@gmail.com	\N	2	7328	2023-04-08 10:31:41+00	1	50	1680929921491-902456934.jpg	\N	3	t	t	dseldx85ye	\N	f	2023-04-08 04:58:41.524+00	2023-04-08 04:58:41.524+00
d0247d36-982d-4d82-b552-c28338bcc67c	parent 001	rayepot144@hrisland.com	$2b$10$VJJCwWFTJ0Uxd6iLY.R2JO9e9de4A5crpa25Urgcu.hP983MRyi4m	1	1589	2023-04-11 16:35:55+00	1	45	1681206976295-125883342.png	\N	3	t	t	i20qwnldkt	\N	f	2023-04-11 09:56:16.453+00	2023-04-11 11:04:34.271+00
2a64ca87-552e-4b3c-aa8e-aeb1e9597fc2	jikas	jisax61257@cyclesat.com	$2b$10$FlH3LOs/fTnAZkSF5GE7/u8CvdNdJg1Gqcv2ER2q5nX/lc3q6rCXe	1	7063	2023-04-08 11:35:37+00	0	50	1680933588874-260015695.jpg	1	1	t	t	hn3drq4ejk	the university	f	2023-04-08 05:59:49.058+00	2023-04-08 06:03:22.65+00
48bb84ff-714f-4e7e-8172-359adfb1f13e	xcodethemes harsh	xcodethemesharsh@gmail.com	\N	2	3164	2023-04-08 09:51:56+00	1	40	1681104587260-864968862.jpg	\N	3	t	t	3at9pqq8ox	\N	f	2023-04-08 04:18:56.194+00	2023-04-10 05:29:47.268+00
7f5b6fa9-e662-490b-819d-e10fdd790bda	nirupa	anantaniru77@gmail.com	\N	2	1956	2023-04-08 12:22:35+00	0	25	1680936575312-42527390.jpg	2	1	t	t	1xzq4d1sob	the first name 	f	2023-04-08 06:49:35.349+00	2023-04-10 05:32:12.848+00
d8dbc425-be21-4f3a-beab-a37e6397e24f	jisax cycle	soleke3747@dogemn.com	$2b$10$QeQKbIUKI6U83xEk8svPm.PADPsDYAPMtx8hNav6KFAOc3yRTqzzS	1	7013	2023-04-10 11:27:35+00	1	25	1681106075281-835141405.jpg	3	1	t	t	9hrj6uqvx5	the first name was 	f	2023-04-10 05:54:35.567+00	2023-04-10 05:54:35.567+00
9688397f-6b0a-4857-ba38-78d48f536ba3	fohick football	fohicik896@duiter.com	$2b$10$X4Z0xtB3SgAVH8K7.AEO2.Vy.o6IIv.SlW877pV8Hp5HoPxvqds.i	1	3081	2023-04-10 11:35:03+00	1	18	\N	4	1	t	t	daqrrtx3sd	apple	f	2023-04-10 06:02:03.224+00	2023-04-10 06:02:03.224+00
dac88882-c1c5-4855-b0e5-56492ef89f08	tennis player	anantahappy2@gmail.com	$2b$10$wi.xGXy/hiFvX/hYK4YX0O/CVOZmfdDOPkXGDR3wOreqBH9Gbs6sW	1	9665	2023-04-10 11:49:36+00	1	12	\N	7	1	t	t	cpf8g7cfio	tennis training centre	f	2023-04-10 06:16:36.052+00	2023-04-10 06:16:36.052+00
976cf3fc-6935-4e69-9de2-df5b256b0ba6	hockey player	toropi2828@djpich.com	$2b$10$tVE.84XO1CXOSXP3j.bHjOpAo/QtVNFANPJhXzofUV8S5m6W9yZPm	1	6695	2023-04-10 12:04:48+00	1	20	\N	8	1	t	t	ozadq43vd6j	hockey central	f	2023-04-10 06:31:48.757+00	2023-04-10 06:31:48.757+00
e3c3ebce-f2c8-403d-9894-b22a4df7fd84	lacrosse players	yixeram582@mitigado.com	$2b$10$ru34imdxB8b.eaWQ0QFDX.QrMDk9jMix4wc8SzNxWxiLlg7Z20Lj6	1	3667	2023-04-10 12:10:52+00	1	12	\N	9	1	t	t	wamc5mqa3n	lascrossb	f	2023-04-10 06:37:52.69+00	2023-04-10 06:37:52.69+00
657975cc-7b3e-49bd-8dc8-76e5cba3293f	see invisible	invisablesea@gmail.com	\N	2	8200	2023-04-12 10:41:32+00	0	45	\N	\N	3	t	t	dwwpdvnlo6	\N	f	2023-04-12 05:08:32.435+00	2023-04-12 05:08:32.435+00
576a1e23-df24-452d-ba2a-b06c7a6a8f4c	Parent Test	parentgethypetest@gmail.com	$2b$10$qMd1R7yvJsaFDtfT2GnLc.icYaNyhbJpkFheH48fQrw5Jz71rdW/.	1	9707	2023-06-06 21:45:46+00	1	48	1686069122451-609237355.jpg	\N	3	t	t	b0qgqp1juj	\N	f	2023-06-06 16:12:46.653+00	2023-06-06 16:32:02.499+00
25e7261a-dd11-425c-b01a-5796cf7895c8	coach 002	gehoko4030@fitzola.com	$2b$10$6OaV.tMpxhtg6jiALAsOYuaniF7E9oQShAaxlBjy/e8waK09sVj9G	1	6016	2023-04-12 11:00:17+00	0	14	1681277237843-761005576.jpg	6	2	t	t	6n6qk8wzcs	the dark universe	f	2023-04-12 05:27:17.962+00	2023-04-12 05:27:17.962+00
2b6aa620-df6c-43a6-92c6-1e4b3de4706b	parent 0002	wofiy49138@snowlash.com	$2b$10$elsRKczngsRo.7MagOwWSeU8wj7AXnykOt4qxb5XWZsCJ/gAR9zSu	1	1703	2023-04-12 15:29:05+00	1	45	\N	\N	3	t	t	fw9qezxz05	\N	f	2023-04-12 09:56:05.999+00	2023-04-12 09:56:05.999+00
2708368c-5909-4942-aeb2-f7ab3c8c8278	Leanna Murphy	leanna@get-hype-app.com	$2b$10$colnMbcI5TpFzqr2XbusteAeE6KCJvZaj6xaba2GM0wLlxlRwJdou	1	2524	2023-04-14 17:28:39+00	2	28	\N	\N	4	t	\N	6gsvulkqmz	\N	f	2023-04-14 11:55:39.303+00	2023-04-14 11:55:39.303+00
579ce8e1-3110-4035-814e-28e9a13e6ded	Leanna Murphy	leannamurphy2135@gmail.com	$2b$10$qIvJNp42t/qJyiBBYimVbOgmXGgOFeeYfoCg5svWvUv2w6fjrsDsS	1	8667	2023-05-13 16:25:27+00	2	38	\N	1	2	t	t	xbvngu5x8e	West Jessamine Middle School	f	2023-05-13 10:52:28.032+00	2023-05-13 10:52:28.032+00
f6b2b18e-e0fa-414f-b875-1e677074283f	Player test	playergethypetest@gmail.com	$2b$10$jcIUPC9DX3YYCnqc.18/Xe.quTi5KW5nYYp9JvIxwwlgnFve008sG	1	1771	2023-06-06 18:49:02+00	1	19	1686057362624-329751997.jpg	1	1	t	t	bxp3kplree	UCLA	f	2023-06-06 13:16:02.773+00	2023-06-06 13:16:02.773+00
719f45fd-4157-4d3b-bbd0-61a8b49def49	Jesus Enrique Gonzalez	jegy1990@gmail.com	\N	2	5142	2023-06-07 01:09:40+00	1	33	\N	6	1	t	t	xxyvrj38lji	UCV	f	2023-06-06 19:36:40.499+00	2023-06-06 19:36:40.499+00
1894fdf1-5eca-438f-8ebb-5078dd18ff01	temp user	goxas15944@soremap.com	$2b$10$dMQITN5j.5CIiL4XWEZdOuGVdFxfOJQqi6R4/vm5q3BCk1QG/bvm.	1	6560	2023-06-07 15:17:54+00	1	20	\N	2	1	t	t	e7dqfgb7cf	high land university	f	2023-06-07 09:44:54.16+00	2023-06-07 09:44:54.16+00
74ca1b0a-82f9-4852-b8da-c1b33181a997	golf player	anantautsav@gmail.com	$2b$10$kLJi40TNkqQBMD3dTik2HO8.AjSAYtcregdQ9LZQD36usOcTetlXy	1	4645	2023-06-10 12:43:06+00	1	25	\N	6	1	t	t	e7mrboxrnwj	the new schedule	f	2023-04-10 06:08:53.572+00	2023-06-10 07:10:06.507+00
0d609944-95c2-42ca-8e8e-5f19147f675e	User Root	jaysoni5579@gmail.com	$2b$10$JTX0OUvZrdIOHBCp1GG1DuXs9kSmqEU5E9YTnbv0327wy1zh39Wba	1	1153	2023-06-16 14:27:50+00	1	24	\N	\N	4	t	\N	3lh0dyb4xn	\N	f	2023-04-04 04:29:57.013+00	2023-06-16 08:55:58.491+00
2a4171ab-148c-42be-8d73-707f618534b1	user 1	nitasa5425@devswp.com	$2b$10$zNM15RFrWN3Y1qCywpS1Iepzj0zbqQnKYa.XC5kR8.W221UVRVugO	1	3706	2023-06-26 21:23:56+00	0	25	\N	1	1	t	t	o5i6iaud6c	the apple	f	2023-06-26 15:50:56.232+00	2023-06-26 15:50:56.232+00
2bfc6b48-edb7-4481-8190-228af6695007	jaysoni	jaysoni5571@gmail.com	$2b$10$WX/4OmqenxbhHF4F95Zx5OofhjzMr7H22xMfWd3LbCTYO6BZjEmyO	1	9370	2023-06-27 15:45:04+00	1	23	\N	\N	5	t	\N	lrqs5szpv5	\N	f	2023-06-27 10:12:04.96+00	2023-06-27 10:12:04.96+00
a3629d4e-f26f-43cb-9c3e-5461022ff427	Coach test	coachgethypetest@gmail.com	$2b$10$logBCbapH.2rsURMoYub2.O2/ybqWRhZz5b12T70yqz8zeGxQu9q2	1	8912	2023-06-06 22:41:20+00	1	56	1686071300871-146232778.jpg	1	2	t	t	664gq06slr	UCLA	f	2023-06-06 17:08:20.986+00	2023-06-28 08:31:33.744+00
7d812252-ad98-434a-98af-ba059971b67f	temp coach 001	biwese7835@mitigado.com	$2b$10$1P4mgCsvX2ZbQ.QlmG/VGOZ1gtwQ2hhp6tbW3tD2Z1oFVfo1t9Ulm	1	4274	2023-04-10 16:26:02+00	1	21	\N	4	2	t	t	a6q89a9o1j	high valley 	f	2023-04-10 10:53:02.24+00	2023-06-28 08:31:37.774+00
f8055eec-7438-45a8-aed1-5d46d6a447d3	Apple John	tqbmvgqdgr@privaterelay.appleid.com	\N	3	8790	2023-08-11 04:28:26+00	0	33	\N	2	1	t	t	vdcc77knyb	1231	f	2023-08-10 22:55:26.972+00	2023-08-10 22:55:26.972+00
8a19651e-6c70-46fe-b81a-81f5330bc2f8	Apple John	g67nwcjfvf@privaterelay.appleid.com	\N	3	7166	2023-08-15 22:10:42+00	0	12	\N	1	1	t	t	2a82j57dyo	Test	f	2023-08-15 16:37:42.664+00	2023-08-15 16:37:42.664+00
b550f32f-1900-4782-aa09-8aea504fb0ee	Leanna Murphy	leanna@sparcrecovery.com	$2b$10$5dG5Z4IOyXJO3RFls1CVieKey4HiMLrrOh2WVmba2qZzG6wiOPTWK	1	5817	2023-06-11 03:16:17+00	2	11	\N	2	1	f	t	mzb148wmpai	West Jessamine 	f	2023-06-10 21:43:17.593+00	2023-09-06 18:07:32.3+00
473086b3-3778-4b92-ab4c-c11b22421f3c	Leanna Murphy	gametimehypeinfo@gmail.com	\N	2	7796	2023-06-24 02:51:30+00	0	11	\N	1	1	f	t	aaf6h4n6osk	west 	f	2023-06-23 21:18:30.875+00	2023-09-06 18:09:04.021+00
10670a64-f419-48aa-b788-63ed4a3798a7	Dilip Coach	dilipkumar@yopmail.com	$2b$10$gmfhdKKbN74q2CmcXztcru89SE/0C6XWkaBxYzmU4JUjwgRPQiOIi	1	5486	2023-07-29 11:07:15+00	1	36	1697092591884-416504024.jpg	2	2	t	t	d4v406tsqt	Testing 	f	2023-07-29 05:34:15.09+00	2023-10-12 06:36:31.904+00
b11ff58a-ce48-4e0c-a985-bb1d193e1ac9	Dilip Parent	dilipparent@yopmail.com	$2b$10$tDWirkzs8nKUo3kg1NLhAuMQTAp4f.Ln1N/7Z6/r3qIGyp.n2M4Um	1	8621	2023-07-29 11:26:42+00	1	36	1697807525788-687462716.jpg	\N	3	t	t	icngjlzn8b	\N	f	2023-07-29 05:53:42.07+00	2023-10-20 13:12:05.8+00
cf6cdab8-0e75-4518-bb37-14b9aba6d267	Apple John	2kfdfrjwwh@privaterelay.appleid.com	\N	3	9634	2023-09-06 05:17:40+00	1	52	\N	2	1	t	t	u11863q8rs	fui	f	2023-09-05 23:44:40.398+00	2023-09-05 23:44:40.398+00
b5ad960f-bcbd-4fd5-a8ab-f3e86175cd9a	Michelle Willoughby	michellemwilloughby@gmail.com	\N	2	9299	2024-01-16 05:54:00+00	2	30	\N	5	1	t	t	fs6oexurrn	Eku 	f	2024-01-16 00:21:00.57+00	2024-01-16 00:21:00.57+00
82eeaa00-4577-43eb-8509-f126179b2b56	Randy Murphy	jrmkm2@gmail.com	\N	3	5268	2024-01-24 06:33:37+00	1	43	\N	\N	3	t	t	a5iqxll6nl	\N	f	2024-01-24 01:00:37.303+00	2024-01-24 01:00:37.303+00
bcb0c977-a968-4f39-8b3f-efcded0e65e5	Braden Ewing	nvgx8f2tr8@privaterelay.appleid.com	\N	3	1724	2023-09-08 05:21:16+00	1	15	1694130579734-418746189.png	2	1	t	t	joitxzgt5c	boone county high school	f	2023-09-07 23:48:16.827+00	2023-09-07 23:49:39.761+00
5110e525-8d24-4aba-ba67-d224aaa03fce	Knox Bur	knoxbur13@gmail.com	\N	2	8058	2023-09-08 06:10:30+00	1	10	\N	2	1	t	t	uko624eqad	Adair County 	f	2023-09-08 00:37:30.993+00	2023-09-08 00:37:30.993+00
7505e5d1-50a5-41ff-9ef0-6437444ee7fc	Tinley Fugate	tinleybug319@icloud.com	\N	3	4257	2023-09-08 04:48:24+00	2	12	1694212467827-222284547.jpg	2	1	t	t	b9cxdhh0ju	Walton Verona 	f	2023-09-07 23:15:24.537+00	2023-09-08 22:34:27.848+00
100b8123-688c-4af4-9a61-c4e147143aac	dilipparent3	dilipparent3@yopmail.com	$2b$10$61GkUk2vD12IQC8BsPY0tenf9zc.Q4i9HXWLVa.M/KehM77nMJvLG	1	4287	2023-09-16 15:16:25+00	1	35	\N	\N	3	t	t	dad2xdloj4	\N	f	2023-09-16 09:43:25.138+00	2023-09-16 09:43:25.138+00
f55f9574-5100-4cda-b9bf-49811b672031	Leanna Williams	Leannawilliams316@gmail.com	$2b$10$QMKL7.MqYEdhpzFwxygoj.LbVeebABRmdeK9qrEoJuk06atJTIJau	1	7055	2023-09-19 19:40:10+00	2	38	\N	\N	3	t	t	y9mivx5fuv	\N	f	2023-09-19 14:07:10.278+00	2023-09-19 14:07:10.278+00
075dd158-26c2-4898-91cd-5572b4aa4dc2	Gujjari Sirisha	gujjarisirisha.hyd@gmail.com	\N	2	2806	2023-09-21 15:58:32+00	2	25	\N	2	1	t	t	6c7ev0r2z1	Osmania university n	f	2023-09-21 10:25:32.809+00	2023-09-21 10:25:32.809+00
e650763e-d8cd-48b8-a978-b12adbf159c4	Lis Garcia	lgarcia@yittbox.com	$2b$10$yWKLRn2ebIieOOAVHXVM3uVuNsLSHt42ydOqu41g6Di8J15VB2q.W	1	8028	2024-01-24 06:35:32+00	2	28	\N	5	1	t	t	6fwu398o6f	UCV	f	2024-01-24 01:02:32.168+00	2024-01-24 01:02:32.168+00
8d7aba03-d49d-49e5-9fa8-d05bb4fc99ee	devender 	mdevendar.hyd@gmail.com	$2b$10$MUVXa3.r6gmS.6n4PdVWie8AemWATGNV3y2Qoh5k4TZ.Jof31G7sO	1	2661	2024-01-30 12:56:15+00	1	25	\N	1	1	t	t	z4t40oiqu1	yuuf78	f	2024-01-30 07:23:15.633+00	2024-01-30 07:23:15.633+00
40a46846-00c4-4d5b-88d9-f71ef6e078c8	ha thu	harleyhl123@gmail.com	$2b$10$C32Ydq92lntYjIy5Yr88deqi7OFiTjOfvIyZQlPCPOEdC1QE63ZbC	1	5189	2024-01-30 13:37:48+00	2	22	\N	2	1	t	t	g2d7dqswbg	open	f	2024-01-30 08:04:48.876+00	2024-01-30 08:04:48.876+00
9d5a2086-fc35-49ac-ade4-8690a88db24c	Dilip Player	dilip@yopmail.com	$2b$10$WpWwv28YWKm7ievUfiFGl.fgnP9LOV5cposSo1v/wRueJoixmpYGO	1	9131	2023-07-29 10:19:24+00	1	36	1697432714704-791169302.jpg	2	1	t	t	kdhlesyhje	Surat	f	2023-07-29 04:46:24.082+00	2023-10-16 05:05:14.73+00
228f909e-70d1-4b69-bae8-6f72cfee94aa	Leanna Williams	leannawilliams316@gmail.com	$2b$10$/Q.dl6ZQKKAdmsFCv.KubeUCW6r/iRorVqbP.HgpekkhGOePWQeVy	1	8431	2023-09-27 19:52:17+00	2	38	\N	\N	3	t	t	57oc1novzu	\N	f	2023-09-27 14:19:17.067+00	2023-09-27 14:19:17.067+00
c1b1395e-c9fa-4de4-b148-07d032e5f763	Alex Williams	alexwill2490@gmail.com	$2b$10$DgeWO6q8LNTbtmmw2PG1.eK3S5MjU1IcA0CEsorm3m3d5jhRMf64i	2	9450	2023-09-27 19:35:43+00	1	34	1695828402820-586196341.png	4	2	t	t	xkntwx8qxs	University of Kentucky	f	2023-09-07 15:49:11.261+00	2023-09-27 15:26:42.845+00
b1506c9d-f34b-4591-9a0a-76712b7056d9	Jordan Keefover 	jkeefover@icloud.com	$2b$10$tCwLMYuZKvKlt7qoT.ICtuNoM760CQWiXJZCqG1q6.soK9nM/M0Iu	1	1054	2023-10-22 04:16:27+00	1	14	1697928207813-720790665.jpg	4	1	t	t	2bdwe1rgcc	Chesterton middle school	f	2023-10-21 22:43:27.961+00	2023-10-21 22:43:27.961+00
17caaa25-81bd-4379-acc9-13f67e9d6fa7	Abel Alem	avel.alem10@gmail.com	$2b$10$NG6ehqqwHGAbmAtC/XOXJudx/vvm/a6noNBvZ88xnVtLmO6QM3UnW	1	8475	2024-02-07 12:37:18+00	1	30	\N	1	2	t	t	w4ett7fg5u	Addis Ababa University 	f	2024-02-07 07:04:18.734+00	2024-02-07 07:04:18.734+00
78e8d202-0dcc-48ad-9857-6cc7549b9c6b	Apple John	bkx84rbjzh@privaterelay.appleid.com	\N	3	9411	2023-10-27 17:28:38+00	0	66	1698407738510-122226360.jpg	8	1	t	t	uwnojkehsu	Bcbcb 	f	2023-10-27 11:55:38.627+00	2023-10-27 11:55:38.627+00
efefac22-4f55-453d-a6ca-fecd568cf02e	Ryan Vaughan	Ryan.vaughan@cornerstonedx.com	$2b$10$2Sj4bGqRXNtpVN6LgxLl2O5YXLQndbg/TIIdTPR/XLYr/9PZcSy4i	1	9575	2023-11-17 00:01:43+00	1	39	\N	6	2	t	t	xsy41tfxek	Tes 	f	2023-11-16 18:28:43.254+00	2023-11-16 18:28:43.254+00
3aaae493-145b-4393-983c-763fc4d06295	Harold Isaacs	haroldisaacs1@gmail.com	$2b$10$IuZMtP4RtJUmQgd9sh0HFOi2XN3WlAZpreP/p0Zm29yqj004k5QaC	1	2193	2023-10-05 21:03:48+00	0	69	\N	2	2	t	t	y5igzpphnt	Kentucky Synergy 	f	2023-10-05 15:30:48.275+00	2023-10-05 15:30:48.275+00
74e7f5f9-d679-40da-959b-59cf9b8dadb4	Jacob Burton	jacobburton03@gmail.com	\N	2	7222	2023-10-06 20:17:15+00	1	37	\N	\N	3	t	t	m5040l7kcc	\N	f	2023-10-06 14:44:15.793+00	2023-10-06 14:44:15.793+00
16225b25-b8b0-4499-9a64-2cf74b39e520	Apple John	cbm5xfnnb6@privaterelay.appleid.com	\N	3	8280	2023-11-29 16:25:27+00	0	30	\N	7	1	t	t	ur1npa1q7m	Columbia High	f	2023-11-29 10:52:27.767+00	2023-11-29 10:52:27.767+00
39239695-431a-4841-9958-dd95b4106d90	Emily Dang	officialmlemusic@gmail.com	\N	2	9875	2023-12-26 22:40:49+00	2	21	\N	5	1	t	t	6x7cw68fw4	California State University, Long Beach 	f	2023-12-26 17:07:49.232+00	2023-12-26 17:07:49.232+00
68c0b5c1-b74e-4cad-a3f3-b2a534a463e3	Oscar	Oscarboscar2023@gmail.com	$2b$10$31u.O.glloZzOe3UihmQC.mIP8LUHbvoc10t3lf82XhtcRnSmKb.e	1	4392	2023-09-06 17:28:34+00	1	11	1697023077656-11171130.jpg	1	1	t	t	l9s7z4qgmx	West Jessamine Middle School	f	2023-09-06 11:55:34.273+00	2023-10-11 11:17:57.673+00
bc081193-18aa-49ad-8da0-66a0c46a7eb9	Lavakumar Gatla	kumarlava.hyd@gmail.com	\N	2	9390	2024-01-01 14:20:17+00	1	18	\N	1	1	t	t	o0yps95w77	dndndndkddk	f	2024-01-01 08:47:17.461+00	2024-01-01 08:47:17.461+00
70aa1373-4ffc-4c85-9cbf-efa49ea37294	Nirin	nirin69098@ubinert.com	$2b$10$pMXV9gl1ehHCQlscN4Mp.ej4gVCXBT8R93EEP7yPtb1YAisptlgJu	1	2882	2024-01-03 11:33:19+00	0	16	\N	1	1	t	t	knfh1d0ripl	hard school	f	2024-01-03 06:00:19.563+00	2024-01-03 06:00:19.563+00
3ff87fa1-3b13-48dd-9984-95ff58d3ed7b	samuel negalign	samuelnegalign1@gmail.com	$2b$10$UxH9lit.ukJxhlmRyWmoa.ZWKWIQnAECmPWxmguXRKYc07ROG.aPu	1	4585	2024-03-06 22:40:29+00	1	25	\N	1	2	t	t	x4yww8zzh2	AAU	f	2024-03-06 17:07:29.608+00	2024-03-06 17:07:29.608+00
c9c1f395-a9f3-4e4d-a7e4-18db8b692aa5	frehiwot negalign	frenegalign1@gmail.com	$2b$10$Zl13NGY8vSzNvNOvhVeAOe.h/vARUuYblN5P6dsulOBNlNzKoXN.m	1	9398	2024-03-06 23:08:13+00	2	23	\N	1	2	t	t	w81rmvj9z3	AAU	f	2024-03-06 17:35:13.065+00	2024-03-06 17:35:13.065+00
390a3e37-8a91-4ae4-987f-f671bd34a650	Jaelyn Dye	melissadyern@aol.com	$2b$10$p0I0IbSLUa1tr9hBFKCvgOvasHL.V.yvcD/16VHwrB5ijOmXSauQO	1	7233	2024-01-08 09:12:59+00	2	15	\N	2	1	t	t	54exp1udxb	southwestern high school	f	2024-01-08 03:39:59.563+00	2024-01-08 03:39:59.563+00
16ed92f3-f879-4699-81b5-e0d8fc6bb890	Melissa Dye	psychnpdye@gmail.com	$2b$10$/O9nR1E2IKqoPjRsWl0oUOhrAr35ru9GnlPta4CMCXk.e42uOet.i	1	7631	2024-01-08 09:19:45+00	2	51	\N	\N	3	t	t	x9umcqyi4d	\N	f	2024-01-08 03:46:45.101+00	2024-01-08 03:46:45.101+00
b710750d-4291-4c7c-b631-5e63d0b664df	James Dye	gamebreakers2001@msn.com	$2b$10$BSbBATtwfY/mI4VyYcQ/3.Y.fmXuEDuumLazYUs8.nSaciZq.Lyg.	1	1373	2024-01-08 23:38:26+00	1	49	\N	\N	3	t	t	9h8ii8tpug	\N	f	2024-01-08 18:05:26.436+00	2024-01-08 18:05:26.436+00
31b62c8f-213d-4e1b-9695-0609c5170cfb	Brittany Sharp	brittanymsharp30@gmail.com	\N	3	5739	2024-01-09 21:49:43+00	2	11	\N	2	1	t	t	rwa5cjvgm7	Walton 	f	2024-01-09 16:16:43.032+00	2024-01-09 16:16:43.032+00
bbf6c7ba-efb8-47c0-bfaf-bb76cb3d052f	Abel Alem	abelalem19@gmail.com	$2b$10$Nod4TiqljVEUrJtWqI6ipOfMy5D/ODgGEN5BSG8oNn45B8PA849GG	1	4605	2024-03-07 22:28:17+00	1	34	\N	1	2	t	t	8d783yf1ku	Hawassa University	f	2024-03-07 16:55:17.133+00	2024-03-07 16:55:17.133+00
02d196ee-604d-4b60-9baf-5dc28483a43c	Avel Alem	abel.alem@a2sv.org	$2b$10$KPYXSBa5gKzingJm470EU.bXQYKvMGhiRgk4V4jPxMGbQuEDgF5yS	1	4692	2024-03-07 23:12:19+00	1	18	\N	1	1	t	t	42p520ebvb	hdhd	f	2024-03-07 17:39:19.68+00	2024-03-07 17:39:19.68+00
b1413a4c-a009-47bf-b99e-1b03dab3ed2a	Sami Negalign	samuelnegalign2@gmail.com	$2b$10$LIMl.kTGfEpwNeqBcM4xmOJI/8vM/Q.s.MCw01tuiSvKZTEcfBYpq	1	4463	2024-03-07 23:28:55+00	1	26	\N	1	1	t	t	q6ks9tdofbh	djdjd	f	2024-03-07 17:55:55.989+00	2024-03-07 17:55:55.989+00
e5cd573c-e1d8-471f-99b6-c69260365ea2	henok	mitkuhenok@gmail.com	$2b$10$KquSN/sEz/nSPyyxHtilYORu8sKxrS97d6/aaQB014yJyjhWzBdDm	1	7020	2024-03-11 23:38:44+00	1	25	\N	1	1	t	t	gtndj0fip4	aau	f	2024-03-11 18:05:44.459+00	2024-03-11 18:05:44.459+00
1c950256-e659-4748-ae45-7b73410fdbe9	Abel Alem	avael.alem7@gmail.com	$2b$10$k6Bpw7sptZInfrs307Zaj.6Q4Q0tUptN9eTt2K6WSlCu9AJW812za	1	4425	2024-03-18 22:45:08+00	1	18	\N	1	1	t	t	hr0cd8q19i	asdf	f	2024-03-18 17:12:08.35+00	2024-03-18 17:12:08.35+00
\.


--
-- Data for Name: volleyballs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volleyballs (id, "gameName", "blockSolo", "blockingAssists", assists, "handlingErrors", dig, kills, "serviceAce", "setsPlayed", "pointsScored", "Tackles", "hittingAverage", "totalAttempts", "matchStatus", score, "userId", date, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 7, true);


--
-- Name: appleTransactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."appleTransactions_id_seq"', 235, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 4, true);


--
-- Name: googleAds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."googleAds_id_seq"', 2, true);


--
-- Name: modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modules_id_seq', 18, true);


--
-- Name: parents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parents_id_seq', 35, true);


--
-- Name: refers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refers_id_seq', 3, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: sports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sports_id_seq', 9, true);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.states_id_seq', 50, true);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: androidTokens androidTokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."androidTokens"
    ADD CONSTRAINT "androidTokens_pkey" PRIMARY KEY ("userId");


--
-- Name: appleIds appleIds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."appleIds"
    ADD CONSTRAINT "appleIds_pkey" PRIMARY KEY (id);


--
-- Name: appleTransactions appleTransactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."appleTransactions"
    ADD CONSTRAINT "appleTransactions_pkey" PRIMARY KEY (id);


--
-- Name: audioTracks audioTracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."audioTracks"
    ADD CONSTRAINT "audioTracks_pkey" PRIMARY KEY (id);


--
-- Name: baseballs baseballs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baseballs
    ADD CONSTRAINT baseballs_pkey PRIMARY KEY (id);


--
-- Name: basketballs basketballs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basketballs
    ADD CONSTRAINT basketballs_pkey PRIMARY KEY (id);


--
-- Name: blacklistedUser blacklistedUser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."blacklistedUser"
    ADD CONSTRAINT "blacklistedUser_pkey" PRIMARY KEY (email);


--
-- Name: blocklists blocklists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blocklists
    ADD CONSTRAINT blocklists_pkey PRIMARY KEY (id);


--
-- Name: blocklists blocklists_userId_blockedUserId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blocklists
    ADD CONSTRAINT "blocklists_userId_blockedUserId_key" UNIQUE ("userId", "blockedUserId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: challengesLikes challengesLikes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."challengesLikes"
    ADD CONSTRAINT "challengesLikes_pkey" PRIMARY KEY (id);


--
-- Name: challenges challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: countDownClocks countDownClocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."countDownClocks"
    ADD CONSTRAINT "countDownClocks_pkey" PRIMARY KEY (id);


--
-- Name: emailInvitees emailInvitees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."emailInvitees"
    ADD CONSTRAINT "emailInvitees_pkey" PRIMARY KEY (id);


--
-- Name: fcms fcms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fcms
    ADD CONSTRAINT fcms_pkey PRIMARY KEY ("fcmToken");


--
-- Name: footballs footballs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footballs
    ADD CONSTRAINT footballs_pkey PRIMARY KEY (id);


--
-- Name: gamePractises gamePractises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."gamePractises"
    ADD CONSTRAINT "gamePractises_pkey" PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: getLatestMessages getLatestMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."getLatestMessages"
    ADD CONSTRAINT "getLatestMessages_pkey" PRIMARY KEY (id);


--
-- Name: golfs golfs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.golfs
    ADD CONSTRAINT golfs_pkey PRIMARY KEY (id);


--
-- Name: googleAds googleAds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."googleAds"
    ADD CONSTRAINT "googleAds_pkey" PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: hockeys hockeys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hockeys
    ADD CONSTRAINT hockeys_pkey PRIMARY KEY (id);


--
-- Name: lacrosses lacrosses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lacrosses
    ADD CONSTRAINT lacrosses_pkey PRIMARY KEY (id);


--
-- Name: matchVideos matchVideos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."matchVideos"
    ADD CONSTRAINT "matchVideos_pkey" PRIMARY KEY (id);


--
-- Name: merchandises merchandises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchandises
    ADD CONSTRAINT merchandises_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: modules modules_name_moduleId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT "modules_name_moduleId_key" UNIQUE (name, "moduleId");


--
-- Name: modules modules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);


--
-- Name: motivationalClipsLikes motivationalClipsLikes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."motivationalClipsLikes"
    ADD CONSTRAINT "motivationalClipsLikes_pkey" PRIMARY KEY (id);


--
-- Name: motivationalClips motivationalClips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."motivationalClips"
    ADD CONSTRAINT "motivationalClips_pkey" PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: parents parents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parents
    ADD CONSTRAINT parents_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: photoalbums photoalbums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photoalbums
    ADD CONSTRAINT photoalbums_pkey PRIMARY KEY (id);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: postGameReviews postGameReviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."postGameReviews"
    ADD CONSTRAINT "postGameReviews_pkey" PRIMARY KEY (id);


--
-- Name: pregamegoals pregamegoals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pregamegoals
    ADD CONSTRAINT pregamegoals_pkey PRIMARY KEY (id);


--
-- Name: premiumUsers premiumUsers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."premiumUsers"
    ADD CONSTRAINT "premiumUsers_pkey" PRIMARY KEY ("userId");


--
-- Name: refers refers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refers
    ADD CONSTRAINT refers_pkey PRIMARY KEY (id);


--
-- Name: refunds refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT refunds_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: shippingRates shippingRates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."shippingRates"
    ADD CONSTRAINT "shippingRates_pkey" PRIMARY KEY ("userId");


--
-- Name: soccers soccers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soccers
    ADD CONSTRAINT soccers_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: sports sports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sports
    ADD CONSTRAINT sports_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: tennis tennis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tennis
    ADD CONSTRAINT tennis_pkey PRIMARY KEY (id);


--
-- Name: userPermissions userPermissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userPermissions"
    ADD CONSTRAINT "userPermissions_pkey" PRIMARY KEY ("userId");


--
-- Name: userTeams userTeams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userTeams"
    ADD CONSTRAINT "userTeams_pkey" PRIMARY KEY (id);


--
-- Name: usergroupdetails usergroupdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usergroupdetails
    ADD CONSTRAINT usergroupdetails_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: volleyballs volleyballs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volleyballs
    ADD CONSTRAINT volleyballs_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_stateId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT "addresses_stateId_fkey" FOREIGN KEY ("stateId") REFERENCES public.states(id);


--
-- Name: addresses addresses_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT "addresses_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: androidTokens androidTokens_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."androidTokens"
    ADD CONSTRAINT "androidTokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: audioTracks audioTracks_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."audioTracks"
    ADD CONSTRAINT "audioTracks_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: baseballs baseballs_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baseballs
    ADD CONSTRAINT "baseballs_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: basketballs basketballs_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basketballs
    ADD CONSTRAINT "basketballs_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: blocklists blocklists_blockedUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blocklists
    ADD CONSTRAINT "blocklists_blockedUserId_fkey" FOREIGN KEY ("blockedUserId") REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: blocklists blocklists_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blocklists
    ADD CONSTRAINT "blocklists_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: carts carts_merchandiseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT "carts_merchandiseId_fkey" FOREIGN KEY ("merchandiseId") REFERENCES public.merchandises(id) ON UPDATE CASCADE;


--
-- Name: carts carts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT "carts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: challengesLikes challengesLikes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."challengesLikes"
    ADD CONSTRAINT "challengesLikes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: challenges challenges_challengeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT "challenges_challengeId_fkey" FOREIGN KEY ("challengeId") REFERENCES public.challenges(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: challenges challenges_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT "challenges_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: communities communities_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT "communities_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: countDownClocks countDownClocks_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."countDownClocks"
    ADD CONSTRAINT "countDownClocks_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: emailInvitees emailInvitees_teamId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."emailInvitees"
    ADD CONSTRAINT "emailInvitees_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: fcms fcms_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fcms
    ADD CONSTRAINT "fcms_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: footballs footballs_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footballs
    ADD CONSTRAINT "footballs_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: gamePractises gamePractises_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."gamePractises"
    ADD CONSTRAINT "gamePractises_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: games games_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT "games_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: getLatestMessages getLatestMessages_groupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."getLatestMessages"
    ADD CONSTRAINT "getLatestMessages_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: getLatestMessages getLatestMessages_messageId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."getLatestMessages"
    ADD CONSTRAINT "getLatestMessages_messageId_fkey" FOREIGN KEY ("messageId") REFERENCES public.messages(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: getLatestMessages getLatestMessages_senderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."getLatestMessages"
    ADD CONSTRAINT "getLatestMessages_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: getLatestMessages getLatestMessages_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."getLatestMessages"
    ADD CONSTRAINT "getLatestMessages_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: golfs golfs_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.golfs
    ADD CONSTRAINT "golfs_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: groups groups_creatorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT "groups_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: hockeys hockeys_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hockeys
    ADD CONSTRAINT "hockeys_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: lacrosses lacrosses_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lacrosses
    ADD CONSTRAINT "lacrosses_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: matchVideos matchVideos_creatorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."matchVideos"
    ADD CONSTRAINT "matchVideos_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: matchVideos matchVideos_teamId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."matchVideos"
    ADD CONSTRAINT "matchVideos_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: merchandises merchandises_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchandises
    ADD CONSTRAINT "merchandises_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON UPDATE CASCADE;


--
-- Name: messages messages_groupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "messages_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- Name: messages messages_senderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "messages_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: messages messages_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "messages_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: modules modules_moduleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT "modules_moduleId_fkey" FOREIGN KEY ("moduleId") REFERENCES public.modules(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: motivationalClipsLikes motivationalClipsLikes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."motivationalClipsLikes"
    ADD CONSTRAINT "motivationalClipsLikes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: motivationalClips motivationalClips_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."motivationalClips"
    ADD CONSTRAINT "motivationalClips_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: orders orders_paymentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_paymentId_fkey" FOREIGN KEY ("paymentId") REFERENCES public.payments(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders orders_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: parents parents_childId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parents
    ADD CONSTRAINT "parents_childId_fkey" FOREIGN KEY ("childId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: parents parents_parentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parents
    ADD CONSTRAINT "parents_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: payments payments_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT "payments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: photoalbums photoalbums_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photoalbums
    ADD CONSTRAINT "photoalbums_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: playlists playlists_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT "playlists_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: postGameReviews postGameReviews_matchVideoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."postGameReviews"
    ADD CONSTRAINT "postGameReviews_matchVideoId_fkey" FOREIGN KEY ("matchVideoId") REFERENCES public."matchVideos"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postGameReviews postGameReviews_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."postGameReviews"
    ADD CONSTRAINT "postGameReviews_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: pregamegoals pregamegoals_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pregamegoals
    ADD CONSTRAINT "pregamegoals_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: premiumUsers premiumUsers_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."premiumUsers"
    ADD CONSTRAINT "premiumUsers_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: refers refers_referedUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refers
    ADD CONSTRAINT "refers_referedUser_fkey" FOREIGN KEY ("referedUser") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: refers refers_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refers
    ADD CONSTRAINT "refers_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: refunds refunds_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT "refunds_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: refunds refunds_paymentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT "refunds_paymentId_fkey" FOREIGN KEY ("paymentId") REFERENCES public.payments(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: refunds refunds_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT "refunds_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: reports reports_challengeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "reports_challengeId_fkey" FOREIGN KEY ("challengeId") REFERENCES public.challenges(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: reports reports_reportedUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "reports_reportedUserId_fkey" FOREIGN KEY ("reportedUserId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: reports reports_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "reports_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: schedules schedules_teamId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT "schedules_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shippingRates shippingRates_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."shippingRates"
    ADD CONSTRAINT "shippingRates_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: soccers soccers_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soccers
    ADD CONSTRAINT "soccers_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: songs songs_playlistId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT "songs_playlistId_fkey" FOREIGN KEY ("playlistId") REFERENCES public.playlists(id) ON DELETE CASCADE;


--
-- Name: songs songs_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT "songs_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: teams teams_creatorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT "teams_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tennis tennis_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tennis
    ADD CONSTRAINT "tennis_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: userPermissions userPermissions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userPermissions"
    ADD CONSTRAINT "userPermissions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: userTeams userTeams_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userTeams"
    ADD CONSTRAINT "userTeams_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: usergroupdetails usergroupdetails_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usergroupdetails
    ADD CONSTRAINT "usergroupdetails_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public.roles(id);


--
-- Name: users users_sportId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_sportId_fkey" FOREIGN KEY ("sportId") REFERENCES public.sports(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: volleyballs volleyballs_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volleyballs
    ADD CONSTRAINT "volleyballs_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

