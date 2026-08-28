-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Positive
-- Test Focus: entity_designator with entity_tag as simple_name — entity_designator used in entity_name_list within attribute_specification; entity_tag is a simple_name identifying the entity (signal, function, label, etc.)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_ent is
  port(clk : in bit; data_in : in bit_vector(7 downto 0); data_out : out bit_vector(7 downto 0));
  attribute pin_number : integer;
  attribute pin_number of clk : signal is 1;
  attribute pin_number of data_in : signal is 2;
  attribute pin_number of data_out : signal is 3;
end entity;

architecture bh of ed_ent is
  signal buf : bit_vector(7 downto 0) := X"00";
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      buf <= data_in;
    end if;
  end process;
  data_out <= buf;
end architecture bh;
