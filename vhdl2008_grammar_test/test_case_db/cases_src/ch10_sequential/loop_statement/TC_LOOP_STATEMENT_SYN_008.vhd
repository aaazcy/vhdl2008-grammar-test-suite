-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Positive
-- Test Focus: For-loop iterating std_logic_vector indices + priority encoder: scans the 8-bit std_logic_vector from high bit (7) toward low bit (0), outputs the encoding when the first '1' is found — verifies the practical hardware pattern (priority encoder) of for-loop descending traversal of an integer subtype range combined with signal indices
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity loop_pri_enc_ent is
  port(din:in bit_vector(7 downto 0); enc:out integer; valid:out bit);
end entity;
architecture bh of loop_pri_enc_ent is
begin
  process(din)
    variable v_enc:integer:=0;
    variable v_valid:bit:='0';
  begin
    v_enc:=0; v_valid:='0';
    for i in 7 downto 0 loop
      if din(i)='1' and v_valid='0' then
        v_enc:=i;
        v_valid:='1';
      end if;
    end loop;
    enc<=v_enc;
    valid<=v_valid;
  end process;
end architecture bh;
