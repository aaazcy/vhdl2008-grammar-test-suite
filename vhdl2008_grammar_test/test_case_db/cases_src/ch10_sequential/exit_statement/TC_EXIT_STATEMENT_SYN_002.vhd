-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Positive
-- Test Focus: With when condition: `exit when cond;` - verifying exit can carry a when condition clause for conditional exit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity exit_when_cond_ent is
  port (
    data   : in  bit_vector(7 downto 0);
    parity : out bit
  );
end entity exit_when_cond_ent;

architecture compute of exit_when_cond_ent is
begin
  process(data) is
    variable v_bit : integer := 0;
    variable v_par : bit := '0';
  begin
    v_bit := 0;
    v_par := '0';
    loop
      v_par := v_par xor data(v_bit);
      v_bit := v_bit + 1;
      exit when v_bit >= 8;
    end loop;
    parity <= v_par;
  end process;
end architecture compute;
