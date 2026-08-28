-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Positive
-- Test Focus: entity_class_entry_list with multiple entity_class_entry items — comma-separated list of entity_class entries (with and without box) in group template declaration, testing { , entity_class_entry } repetition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ecl_list_ent is
  port(data_in : in bit_vector(3 downto 0); data_out : out bit_vector(3 downto 0));
end entity;

architecture bh of ecl_list_ent is
  group mixed_types is (signal, signal <>);
  group data_path : mixed_types (data_in, data_out);
  signal buf : bit_vector(3 downto 0) := "0000";
  constant C_DELAY : time := 2 ns;
begin
  buf <= data_in;
  data_out <= buf after C_DELAY;
end architecture bh;
