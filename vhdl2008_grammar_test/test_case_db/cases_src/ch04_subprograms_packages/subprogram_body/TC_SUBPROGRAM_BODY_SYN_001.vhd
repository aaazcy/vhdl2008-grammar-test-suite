-- =============================================================
-- Case ID: TC_SUBPROGRAM_BODY_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_body ::= subprogram_specification is subprogram_declarative_part begin subprogram_statement_part end [ subprogram_kind ] [ designator ] ;
-- Case Type: Positive
-- Test Focus: Function body with declaration region+variable+return: function declaration region contains type/subtype/constant/variable, body contains if-else+return, end function with designator, verification of full form of subprogram_body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sb_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sb_ent is
  function f_clamp(x,lo,hi:integer) return integer is
    type t_range is range -1000 to 1000;
    constant C_LO:t_range:=t_range(lo);
    constant C_HI:t_range:=t_range(hi);
    variable v:t_range:=t_range(x);
  begin
    if v<C_LO then v:=C_LO; elsif v>C_HI then v:=C_HI; end if;
    return integer(v);
  end function f_clamp;
begin
  y<=f_clamp(a,0,b);
end architecture bh;
