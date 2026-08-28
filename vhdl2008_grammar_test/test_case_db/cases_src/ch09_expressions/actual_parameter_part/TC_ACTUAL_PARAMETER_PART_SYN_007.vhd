-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Positive
-- Test Focus: Actual parameter list in a procedure call - the procedure call passes several actuals of mixed types (integer, bit_vector, bit), verifying the syntax of actual_parameter_part within procedure_call_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_proc_call is
  port (
    a_i : in  integer;
    b_i : in  bit_vector(3 downto 0);
    flag_i : in  bit;
    y_o : out integer
  );
end entity ent_proc_call;

architecture rtl of ent_proc_call is
  procedure accumulate(signal result : out integer; v : integer; vec : bit_vector; f : bit) is
  begin
    if f = '1' then result <= v + vec'length; end if;
  end procedure;
begin
  process(a_i, b_i, flag_i)
  begin
    accumulate(y_o, a_i, b_i, flag_i);
  end process;
end architecture rtl;
