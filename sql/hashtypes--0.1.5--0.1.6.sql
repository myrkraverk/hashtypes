
------------------------------------------------------------------------------

create function sha1_send( sha1 ) returns bytea immutable language
c strict as 'hashtypes', 'sha_send1';

create function sha1_recv( internal ) returns sha1 immutable
language c strict as 'hashtypes', 'sha_recv1';

update pg_type set
  typsend = 'sha1_send(sha1)'::regprocedure,
  typreceive = 'sha1_recv(internal)'::regprocedure
where oid = 'sha1'::regtype;

insert into pg_depend ( classid, objid, objsubid, refclassid,
	refobjid, refobjsubid, deptype ) 
values ( 'pg_type'::regclass, 'sha1'::regtype, 0,
	'pg_proc'::regclass, 'sha1_recv(internal)'::regprocedure, 0, 'n' );

insert into pg_depend ( classid, objid, objsubid, refclassid,
	refobjid, refobjsubid, deptype ) 
values ( 'pg_type'::regclass, 'sha1'::regtype, 0,
	'pg_proc'::regclass, 'sha1_send(sha1)'::regprocedure, 0, 'n' );

do $$
declare version_num integer;
begin
  select current_setting('server_version_num') into strict version_num;
  if version_num >= 90600 then
    execute $f$ alter function sha1_send( sha1 ) parallel safe $f$;
    execute $f$ alter function sha1_recv( internal ) parallel safe $f$;
  end if;
end;
$$;

------------------------------------------------------------------------------

create function sha224_send( sha224 ) returns bytea immutable language
c strict as 'hashtypes', 'sha_send224';

create function sha224_recv( internal ) returns sha224 immutable
language c strict as 'hashtypes', 'sha_recv224';

update pg_type set
  typsend = 'sha224_send(sha224)'::regprocedure,
  typreceive = 'sha224_recv(internal)'::regprocedure
where oid = 'sha224'::regtype;

insert into pg_depend ( classid, objid, objsubid, refclassid,
	refobjid, refobjsubid, deptype ) 
values ( 'pg_type'::regclass, 'sha224'::regtype, 0,
	'pg_proc'::regclass, 'sha224_recv(internal)'::regprocedure, 0, 'n' );

insert into pg_depend ( classid, objid, objsubid, refclassid,
	refobjid, refobjsubid, deptype ) 
values ( 'pg_type'::regclass, 'sha224'::regtype, 0,
	'pg_proc'::regclass, 'sha224_send(sha224)'::regprocedure, 0, 'n' );

do $$
declare version_num integer;
begin
  select current_setting('server_version_num') into strict version_num;
  if version_num >= 90600 then
    execute $f$ alter function sha224_send( sha224 ) parallel safe $f$;
    execute $f$ alter function sha224_recv( internal ) parallel safe $f$;
  end if;
end;
$$;

------------------------------------------------------------------------------

create function sha256_send( sha256 ) returns bytea immutable language
c strict as 'hashtypes', 'sha_send256';

create function sha256_recv( internal ) returns sha256 immutable
language c strict as 'hashtypes', 'sha_recv256';

update pg_type set
  typsend = 'sha256_send(sha256)'::regprocedure,
  typreceive = 'sha256_recv(internal)'::regprocedure
where oid = 'sha256'::regtype;

insert into pg_depend ( classid, objid, objsubid, refclassid,
	refobjid, refobjsubid, deptype ) 
values ( 'pg_type'::regclass, 'sha256'::regtype, 0,
	'pg_proc'::regclass, 'sha256_recv(internal)'::regprocedure, 0, 'n' );

insert into pg_depend ( classid, objid, objsubid, refclassid,
	refobjid, refobjsubid, deptype ) 
values ( 'pg_type'::regclass, 'sha256'::regtype, 0,
	'pg_proc'::regclass, 'sha256_send(sha256)'::regprocedure, 0, 'n' );

do $$
declare version_num integer;
begin
  select current_setting('server_version_num') into strict version_num;
  if version_num >= 90600 then
    execute $f$ alter function sha256_send( sha256 ) parallel safe $f$;
    execute $f$ alter function sha256_recv( internal ) parallel safe $f$;
  end if;
end;
$$;

------------------------------------------------------------------------------

create function sha384_send( sha384 ) returns bytea immutable language
c strict as 'hashtypes', 'sha_send384';

create function sha384_recv( internal ) returns sha384 immutable
language c strict as 'hashtypes', 'sha_recv384';

update pg_type set
  typsend = 'sha384_send(sha384)'::regprocedure,
  typreceive = 'sha384_recv(internal)'::regprocedure
where oid = 'sha384'::regtype;

insert into pg_depend ( classid, objid, objsubid, refclassid,
	refobjid, refobjsubid, deptype ) 
values ( 'pg_type'::regclass, 'sha384'::regtype, 0,
	'pg_proc'::regclass, 'sha384_recv(internal)'::regprocedure, 0, 'n' );

insert into pg_depend ( classid, objid, objsubid, refclassid,
	refobjid, refobjsubid, deptype ) 
values ( 'pg_type'::regclass, 'sha384'::regtype, 0,
	'pg_proc'::regclass, 'sha384_send(sha384)'::regprocedure, 0, 'n' );

do $$
declare version_num integer;
begin
  select current_setting('server_version_num') into strict version_num;
  if version_num >= 90600 then
    execute $f$ alter function sha384_send( sha384 ) parallel safe $f$;
    execute $f$ alter function sha384_recv( internal ) parallel safe $f$;
  end if;
end;
$$;

------------------------------------------------------------------------------

create function sha512_send( sha512 ) returns bytea immutable language
c strict as 'hashtypes', 'sha_send512';

create function sha512_recv( internal ) returns sha512 immutable
language c strict as 'hashtypes', 'sha_recv512';

update pg_type set
  typsend = 'sha512_send(sha512)'::regprocedure,
  typreceive = 'sha512_recv(internal)'::regprocedure
where oid = 'sha512'::regtype;

insert into pg_depend ( classid, objid, objsubid, refclassid,
	refobjid, refobjsubid, deptype ) 
values ( 'pg_type'::regclass, 'sha512'::regtype, 0,
	'pg_proc'::regclass, 'sha512_recv(internal)'::regprocedure, 0, 'n' );

insert into pg_depend ( classid, objid, objsubid, refclassid,
	refobjid, refobjsubid, deptype ) 
values ( 'pg_type'::regclass, 'sha512'::regtype, 0,
	'pg_proc'::regclass, 'sha512_send(sha512)'::regprocedure, 0, 'n' );

do $$
declare version_num integer;
begin
  select current_setting('server_version_num') into strict version_num;
  if version_num >= 90600 then
    execute $f$ alter function sha512_send( sha512 ) parallel safe $f$;
    execute $f$ alter function sha512_recv( internal ) parallel safe $f$;
  end if;
end;
$$;

