-- =============================================================
-- Case ID: TC_ENTITY_TAG_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_TAG
-- Standard Reference: IEEE 1076-2008 Section 6.8
-- Production: entity_tag ::= simple_name | character_literal | operator_symbol
-- Case Type: Positive
-- Test Focus: Exercises entity_tag syntax variant 5 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity entity_tag_syn5 is
  port (
    clk  : in  bit;
    data : in  bit_vector(7 downto 0);
    q    : out bit_vector(7 downto 0)
  );
end entity entity_tag_syn5;

architecture rtl of entity_tag_syn5 is
  attribute pipeline_stage : integer;
  attribute implementation : string;
  signal s_reg : bit_vector(7 downto 0) := (others => '0');
  attribute pipeline_stage of s_reg : signal is 5;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_reg <= data;
      q <= s_reg xor "01010101";
    end if;
  end process;
end architecture rtl;
