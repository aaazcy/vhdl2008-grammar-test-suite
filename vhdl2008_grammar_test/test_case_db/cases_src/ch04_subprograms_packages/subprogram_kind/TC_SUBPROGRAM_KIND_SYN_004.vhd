-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Positive
-- Test Focus: procedure as subprogram_kind in the end clause of subprogram_body — end procedure, verifies the subprogram_kind::=procedure branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sk_proc_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sk_proc_ent is
  procedure p_assign(signal src:in integer; signal dst:out integer) is
  begin dst<=src; end procedure;
begin
  p_assign(a,y);
end architecture bh;
