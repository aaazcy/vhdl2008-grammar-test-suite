-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Positive
-- Test Focus: subprogram_declarative_part with nested function as declaration item: function declaration region contains another function body, verification of nested subprogram declaration region nesting
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdp_nest_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sdp_nest_ent is
  function f_outer(x:integer) return integer is
    function f_abs(v:integer) return integer is
    begin if v<0 then return -v; else return v; end if; end function;
  begin
    return f_abs(x);
  end function;
begin
  y<=f_outer(a);
end architecture bh;
