-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Negative
-- Test Focus: record_type_definition missing "end record" keyword.
--            The production requires "end record [record_type_simple_name]".
--            Without the closing "end record", the definition is
--            incomplete.
-- Expected Result: Triggers syntax error (missing "end record")
-- Dependencies: None
-- =============================================================
entity bad_record_no_end is
  port (
    q : out bit
  );
end entity bad_record_no_end;

architecture rtl of bad_record_no_end is
  -- ERROR: missing "end record" to close the record_type_definition
  type bad_rec is record
    a : integer;
    b : bit;
  signal s : bad_rec;
begin
  q <= '0';
end architecture rtl;
