-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Positive
-- Test Focus: Exercises element_declaration syntax variant 7 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity element_declaration_syn7 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(5 downto 0);
    valid : out bit
  );
end entity element_declaration_syn7;

architecture rtl of element_declaration_syn7 is
  type t_vector is array(0 to 5) of bit;
  subtype t_sub is t_vector;
  constant C_MASK : t_sub := (others => '0');
  signal s_data : t_sub := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      for i in 0 to 5 loop
        s_data(i) <= data(i);
      end loop;
      valid <= '1';
    end if;
  end process;
end architecture rtl;
