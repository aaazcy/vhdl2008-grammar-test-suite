-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Positive
-- Test Focus: Labeled process with "is" keyword and a while loop sequential statement — process_label p_parity encloses a declarative part with three variables, the body uses a while loop iterating through a bit_vector with xor accumulation to compute even parity, exercising the full labeled+is+declarations+iterative sequential statement form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_while_ent is
  port(clk : in bit; data : in bit_vector(7 downto 0); parity : out bit);
end entity proc_while_ent;
architecture bh of proc_while_ent is
begin
  p_parity : process(clk) is
    variable v_par : bit;
    variable v_idx : integer;
    variable v_data : bit_vector(7 downto 0);
  begin
    if clk'event and clk = '1' then
      v_data := data;
      v_par := '0';
      v_idx := 0;
      while v_idx < 8 loop
        v_par := v_par xor v_data(v_idx);
        v_idx := v_idx + 1;
      end loop;
      parity <= v_par;
    end if;
  end process p_parity;
end architecture bh;
