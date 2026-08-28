-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SMN_001
-- Related Rule ID: SMN_RESOLUTI_001
-- Rule Type: Semantic (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Semantic negative — resolution function resolve_const takes a bit_vector parameter while the resolved subtype is integer, but a resolution function must take an unconstrained array parameter of the resolved type, so no matching resolution function exists
-- Expected Result: Triggers semantic error: no matching resolution function for "resolve_const"
-- Dependencies: None
-- =============================================================
entity res_ent is
  port ( a, b : in integer; result : out integer );
end entity res_ent;
architecture rtl of res_ent is
  function resolve_const(drivers : bit_vector) return integer is
  begin
    return 42;
  end function;
  subtype t_const is resolve_const integer;
  signal s : t_const;
begin
  s <= a;
  s <= b;
  result <= s;
end architecture rtl;
