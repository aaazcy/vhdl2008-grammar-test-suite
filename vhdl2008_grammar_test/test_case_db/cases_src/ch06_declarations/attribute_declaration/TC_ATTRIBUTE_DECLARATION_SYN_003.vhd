-- =============================================================
-- Case ID: TC_ATTRIBUTE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: attribute_declaration ::= attribute identifier : type_mark ;
-- Case Type: Positive
-- Test Focus: Exercises attribute_declaration with user-defined attributes for synthesis constraints like max_fanout and resource_hint.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attribute_decl_syn3 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(7 downto 0);
    result : out bit_vector(7 downto 0)
  );
end entity attribute_decl_syn3;

architecture rtl of attribute_decl_syn3 is
  attribute max_fanout    : integer;
  attribute resource_hint : string;
  attribute pipeline_depth : integer;

  signal s_data : bit_vector(7 downto 0);
  attribute max_fanout of s_data : signal is 32;
  attribute pipeline_depth of rtl : architecture is 3;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_data <= data;
      result <= s_data xor "10101010";
    end if;
  end process;
end architecture rtl;
