-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: Multiple kinds of sequential statements mixed——if / case / variable assignment / loop, four different sequential statements, verifying that a process body can mix multiple sequential statement kinds
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity psp_mixed_ent is
  port(clk, rst_n : in bit; din : in bit_vector(3 downto 0); dout : out bit_vector(3 downto 0));
end entity psp_mixed_ent;
architecture bh of psp_mixed_ent is
begin
  process(clk, rst_n) is
    variable v_tmp : bit_vector(3 downto 0);
  begin
    if rst_n = '0' then
      v_tmp := "0000";
      dout <= "0000";
    elsif clk'event and clk = '1' then
      case din is
        when "0000" => v_tmp := "1111";
        when "1111" => v_tmp := "0000";
        when others  => v_tmp := din;
      end case;
      for i in 0 to 3 loop
        v_tmp(i) := v_tmp(i) xor din(i);
      end loop;
      dout <= v_tmp;
    end if;
  end process;
end architecture bh;
