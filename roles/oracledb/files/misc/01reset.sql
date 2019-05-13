--ALTER SESSION SET CONTAINER = DEVBOXPDB1;
DECLARE CURSOR USER_SESSIONS IS SELECT

	s.sid, s.serial#, s.status, p.spid
	from v$session s, v$process p
	where s.username = 'DEVBOX'
	and p.addr (+) = s.paddr;

BEGIN
	FOR I IN USER_SESSIONS LOOP
		BEGIN
			EXECUTE IMMEDIATE 'alter system kill session ''' || i.sid || ',' || i.serial# || '''';
			EXCEPTION
			WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE ('PROBLEM DELETING SESSION: ' || I.SID || ': ' || SQLERRM);
		END;

		EXECUTE IMMEDIATE 'DROP USER DEVBOX CASCADE';

	END LOOP;

END;
\

