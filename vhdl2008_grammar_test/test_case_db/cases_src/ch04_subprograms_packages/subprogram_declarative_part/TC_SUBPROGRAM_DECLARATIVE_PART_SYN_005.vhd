-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Positive
-- Test Focus: subprogram_declarative_part with repetition of a single variable: function declaration region has only one variable, verification of {item} repeated once
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdp_single_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sdp_single_ent is
  function f_dbl(x:integer) return integer is
    variable v:integer;
  begin
    v:=x*2;
    return v;
  end function;
begin
  y<=f_dbl(a);
end architecture bh;
