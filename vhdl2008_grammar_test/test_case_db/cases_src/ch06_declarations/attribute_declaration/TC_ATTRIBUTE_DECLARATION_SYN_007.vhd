-- =============================================================
-- Case ID: TC_ATTRIBUTE_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: attribute_declaration ::= attribute identifier : type_mark ;
-- Case Type: Positive
-- Test Focus: Exercises attribute_declaration syntax variant 7 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attribute_declaration_syn7 is
  port (
    clk  : in  bit;
    data : in  bit_vector(7 downto 0);
    q    : out bit_vector(7 downto 0)
  );
end entity attribute_declaration_syn7;

architecture rtl of attribute_declaration_syn7 is
  attribute pipeline_stage : integer;
  attribute implementation : string;
  signal s_reg : bit_vector(7 downto 0) := (others => '0');
  attribute pipeline_stage of s_reg : signal is 7;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_reg <= data;
      q <= s_reg xor "01010101";
    end if;
  end process;
end architecture rtl;
