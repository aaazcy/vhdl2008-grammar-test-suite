-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Positive
-- Test Focus: entity_class_entry with box '<>' — entity_class followed by box token '<>' indicating an unconstrained entity class in group template, exercising the optional '<>' suffix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ece_box_ent is
  port(data_in : in bit_vector(7 downto 0); data_out : out bit_vector(7 downto 0));
end entity;

architecture bh of ece_box_ent is
  group any_sig_to_any_sig is (signal, signal <>);
  group data_path : any_sig_to_any_sig (data_in, data_out);
  signal buf : bit_vector(7 downto 0) := X"00";
begin
  buf <= data_in;
  data_out <= buf;
end architecture bh;
