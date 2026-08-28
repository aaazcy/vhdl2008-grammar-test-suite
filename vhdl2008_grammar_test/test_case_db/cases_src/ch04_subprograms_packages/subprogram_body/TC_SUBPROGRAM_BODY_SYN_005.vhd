-- =============================================================
-- Case ID: TC_SUBPROGRAM_BODY_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_body ::= subprogram_specification is subprogram_declarative_part begin subprogram_statement_part end [ subprogram_kind ] [ designator ] ;
-- Case Type: Positive
-- Test Focus: procedure body end with subprogram_kind and designator: end procedure p_mux, verification of full form of optional closing tokens of subprogram_body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sb_endkw_ent is port(sel:in bit; a,b:in integer; y:out integer); end entity;
architecture bh of sb_endkw_ent is
  procedure p_mux(signal s:in bit; signal x0,x1:in integer; signal r:out integer) is
  begin
    if s='0' then r<=x0; else r<=x1; end if;
  end procedure p_mux;
begin
  p_mux(sel,a,b,y);
end architecture bh;
