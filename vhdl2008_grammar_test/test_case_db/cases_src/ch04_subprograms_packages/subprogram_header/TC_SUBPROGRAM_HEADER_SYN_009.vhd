-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: procedure with generic (integer) of subprogram_header without generic_map_aspect: procedure p generic(N:integer) — only generic_clause without map aspect, verifies the minimal generic subprogram header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sh_simplegen_ent is port(a,b:in integer; g:out boolean); end entity;
architecture bh of sh_simplegen_ent is
  procedure p_cmp generic(N:integer) parameter(signal x,y:in integer; signal gt:out boolean) is
  begin
    gt<=(x>y);
  end procedure;
  procedure p_cmp_inst is new p_cmp generic map(N=>0);
begin
  p_cmp_inst(x=>a, y=>b, gt=>g);
end architecture bh;
