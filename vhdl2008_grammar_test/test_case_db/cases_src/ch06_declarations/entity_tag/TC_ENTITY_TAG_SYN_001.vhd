-- =============================================================
-- Case ID: TC_ENTITY_TAG_SYN_001
-- Rule Type: Syntax
-- BNF Production: ENTITY_TAG
-- Standard Reference: IEEE 1076-2008 Section 6.8
-- Production: entity_tag ::=
--   simple_name | character_literal | operator_symbol
-- Test Focus: Simple_name form of entity_tag used in attribute
--   specifications — defines user attributes and attaches
--   them to signals using simple_name as entity_tag in the
--   entity_name_list of attribute_specification
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity entity_tag_syn_001 is
  port (
    clk     : in  bit;
    rst_n   : in  bit;
    data_in : in  bit_vector(7 downto 0);
    data_out: out bit_vector(7 downto 0)
  );
end entity entity_tag_syn_001;

architecture rtl of entity_tag_syn_001 is
  -- Define user attributes
  attribute max_fanout : integer;
  attribute keep_hier  : string;
  attribute sync_stage : integer;

  signal s_stage0 : bit_vector(7 downto 0) := (others => '0');
  signal s_stage1 : bit_vector(7 downto 0) := (others => '0');

  -- attribute_specification uses entity_tag (simple_name form)
  -- entity_name_list ::= entity_designator { , entity_designator }
  -- entity_designator ::= entity_tag [ signature ]
  attribute max_fanout of s_stage0 : signal is 16;
  attribute keep_hier  of s_stage1 : signal is "TRUE";
  attribute sync_stage of s_stage0, s_stage1 : signal is 2;

begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_stage0 <= (others => '0');
      s_stage1 <= (others => '0');
    elsif clk'event and clk = '1' then
      s_stage0 <= data_in;
      s_stage1 <= s_stage0;
    end if;
  end process;

  data_out <= s_stage1;
end architecture rtl;
