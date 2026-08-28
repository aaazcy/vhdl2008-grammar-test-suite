-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: named choice with a single element_simple_name: field_a => 10 — using a record field name as the choice in a record aggregate, verifying element_simple_name as choices
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ea_field_name is
  port (
    x : out integer
  );
end entity ea_field_name;

architecture named_field of ea_field_name is
  type t_cfg is record
    mode   : bit;
    threshold : integer;
    offset : integer;
  end record t_cfg;

  signal s_cfg : t_cfg;
begin
  s_cfg <= (mode => '1', threshold => 100, offset => -10);
  x <= s_cfg.threshold + s_cfg.offset;
end architecture named_field;
