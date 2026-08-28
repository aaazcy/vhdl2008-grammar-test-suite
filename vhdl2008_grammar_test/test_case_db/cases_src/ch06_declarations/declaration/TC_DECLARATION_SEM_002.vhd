-- =============================================================
-- Case ID: TC_DECLARATION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Production: declaration ::= type_declaration | subtype_declaration | object_declaration | interface_declaration | alias_declaration | attribute_declaration | component_declaration | group_template_declaration | group_declaration | ...
-- Case Type: Positive
-- Test Focus: Semantic validation of attribute_declaration and specification as alternative declaration forms in architecture.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity declaration_sem2 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(7 downto 0);
    q     : out bit_vector(7 downto 0)
  );
end entity declaration_sem2;

architecture rtl of declaration_sem2 is
  attribute keep_hierarchy : string;
  signal s_reg : bit_vector(7 downto 0) := (others => '0');
  attribute keep_hierarchy of s_reg : signal is "yes";
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_reg <= data;
      q <= s_reg;
    end if;
  end process;
end architecture rtl;
