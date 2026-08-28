-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Positive
-- Test Focus: subprogram_kind (procedure) in a package body: end procedure name of a procedure definition inside the package body, verifies subprogram_kind in the package body context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_sk_proc is
  procedure p_reset(signal v:out integer);
end package pkg_sk_proc;
package body pkg_sk_proc is
  procedure p_reset(signal v:out integer) is
  begin v<=0; end procedure p_reset;
end package body pkg_sk_proc;
entity sk_pkg_ent is port(r:out integer); end entity;
architecture bh of sk_pkg_ent is
  signal s:integer:=42;
begin
  work.pkg_sk_proc.p_reset(s);
  r<=s;
end architecture bh;
