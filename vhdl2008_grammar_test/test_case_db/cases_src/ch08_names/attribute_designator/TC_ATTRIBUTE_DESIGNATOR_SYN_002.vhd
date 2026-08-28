-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Positive
-- Test Focus: attribute_designator as simple_name in attribute specifications — the attribute_designator is the identifier following 'attribute' keyword; exercises multiple user-defined attribute designators applied to different entity classes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attr_desig_ent is
  port(data_in : in bit_vector(3 downto 0); data_out : out bit_vector(3 downto 0));
  attribute max_fanout : integer;
  attribute max_fanout of data_out : signal is 8;
end entity;

architecture bh of attr_desig_ent is
  attribute cell_name : string;
  attribute cell_name of bh : architecture is "buf_driver_4bit";
  signal buf : bit_vector(3 downto 0) := "0000";
begin
  buf <= data_in;
  data_out <= buf after 1 ns;
end architecture bh;
