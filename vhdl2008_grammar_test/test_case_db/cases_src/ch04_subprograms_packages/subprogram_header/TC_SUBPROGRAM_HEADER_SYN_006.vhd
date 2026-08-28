-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: procedure with generic_clause of subprogram_header: procedure p_gen generic(type t) parameter(signal x:in t) — verifies the syntax of the 2008 generic subprogram header in a procedure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sh_proc_gen_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sh_proc_gen_ent is
  procedure p_max generic(type t) parameter(signal a,b:in t; signal r:out t) is
  begin
    r<=a;
  end procedure;
  procedure p_max_int is new p_max generic map(t=>integer);
begin
  p_max_int(a=>a, b=>b, r=>y);
end architecture bh;
