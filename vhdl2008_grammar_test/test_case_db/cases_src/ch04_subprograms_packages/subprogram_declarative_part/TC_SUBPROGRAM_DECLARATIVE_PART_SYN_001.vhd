-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Positive
-- Test Focus: Minimal form: empty subprogram_declarative_part - function with no declaration region going directly to begin return, verification of compilable form with {item} repeated zero times
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdp_min_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sdp_min_ent is
  function f_id(x:integer) return integer is
  begin return x; end function;
begin
  y<=f_id(a);
end architecture bh;
