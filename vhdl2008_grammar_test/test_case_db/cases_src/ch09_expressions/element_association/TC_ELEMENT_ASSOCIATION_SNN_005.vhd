-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Negative
-- Test Focus: SNN: extra comma in the element_association list: (0 => 1, , 2 => 3) lacks an element_association between two consecutive commas
-- Expected Result: Triggers syntax error: extra comma in element_association list; expected element_association between commas
-- Dependencies: None
-- =============================================================
entity ea_snn_005 is
  port (
    x : out integer
  );
end entity ea_snn_005;

architecture extra_comma of ea_snn_005 is
  type t_arr is array(0 to 3) of integer;
  signal s : t_arr;
begin
  -- ERROR: double comma - empty element_association between them
  s <= (0 => 1, , 2 => 3);
  x <= s(0);
end architecture extra_comma;
