-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Positive
-- Test Focus: procedure+function in nested subprograms: an inner function nested inside an outer function, each end clause contains its own subprogram_kind, verifies the independence of the two kinds in nested contexts
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sk_nest_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sk_nest_ent is
  function f_outer(x:integer) return integer is
    function f_sqr(v:integer) return integer is
    begin return v*v; end function f_sqr;
  begin
    return f_sqr(x)+x;
  end function f_outer;
begin
  y<=f_outer(a);
end architecture bh;
