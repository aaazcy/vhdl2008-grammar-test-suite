-- =============================================================
-- Case ID: TC_TYPE_MARK_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_MARK
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: type_mark ::= type_name subtype_name
-- Case Type: Positive
-- Test Focus: Exercises type_mark syntax variant 9 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity type_mark_syn9 is
  port (
    clk   : in  bit;
    addr  : in  integer range 0 to 63;
    data  : out bit_vector(5 downto 0)
  );
end entity type_mark_syn9;

architecture rtl of type_mark_syn9 is
  type t_lut is array(0 to 63) of bit_vector(5 downto 0);
  signal s_table : t_lut := (others => (others => '0'));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      for i in 0 to 63 loop
        s_table(i) <= (others => '1');
      end loop;
      data <= s_table(addr);
    end if;
  end process;
end architecture rtl;
