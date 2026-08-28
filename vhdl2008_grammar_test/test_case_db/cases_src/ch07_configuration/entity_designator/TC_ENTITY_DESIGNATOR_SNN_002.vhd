-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Negative
-- Test Focus: Invalid signature bracket — using parentheses () instead of brackets [] for signature in entity_designator; signature must use square brackets
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ed_snn2_ent is port(r:out integer); end entity;
architecture bh of ed_snn2_ent is
  attribute tag : string;
  function f_test(x : integer) return integer is begin return x; end function;
  attribute tag of f_test (integer return integer) : function is "bad_sig";  -- ERROR: () not valid for signature
  signal s : integer := 0;
begin
  s <= f_test(5); r <= s;
end architecture bh;
