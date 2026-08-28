-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SNN_004
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Negative
-- Test Focus: Empty entity_class_entry_list — the list contains no entries between the parentheses in a group template declaration; entity_class_entry_list requires at least one entity_class_entry
-- Expected Result: Triggers syntax error (empty list)
-- Dependencies: None
-- =============================================================
entity ecl_empty_list is
  port(
    d   : in  bit;
    q   : out bit
  );
end entity;

architecture bh of ecl_empty_list is
  -- ERROR: empty entity_class_entry_list — no entries between parentheses
  group bad_template is ();
  signal reg : bit := '0';
  group bg : bad_template (reg, q);
begin
  process
  begin
    wait on d;
    reg <= d;
    q   <= reg;
  end process;
end architecture bh;
