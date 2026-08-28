-- =============================================================
-- Case ID: TC_IDENTIFIER_LIST_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.2
-- Production: identifier_list ::= identifier { , identifier }
-- Case Type: Positive
-- Test Focus: Exercises identifier_list syntax variant 8 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity identifier_list_syn8 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(7 downto 0);
    valid : out bit
  );
end entity identifier_list_syn8;

architecture rtl of identifier_list_syn8 is
  type t_vector is array(0 to 7) of bit;
  subtype t_sub is t_vector;
  constant C_MASK : t_sub := (others => '0');
  signal s_data : t_sub := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      for i in 0 to 7 loop
        s_data(i) <= data(i);
      end loop;
      valid <= '1';
    end if;
  end process;
end architecture rtl;
