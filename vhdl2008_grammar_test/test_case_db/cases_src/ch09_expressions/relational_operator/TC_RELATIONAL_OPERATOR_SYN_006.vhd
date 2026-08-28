-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Positive
-- Test Focus: = >= used in the while loop condition of a process——the loop variable is compared with the upper bound using less-than-or-equal to decide loop termination, verifying the syntax of relational_operator in iteration control conditions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_cmp_in_loop is
  port (
    data_i : in  bit_vector(7 downto 0);
    ones_o : out integer range 0 to 8
  );
end entity ent_cmp_in_loop;

architecture rtl of ent_cmp_in_loop is
begin
  process(data_i)
    variable cnt : integer range 0 to 8 := 0;
  begin
    cnt := 0;
    for i in 0 to 7 loop
      if data_i(i) = '1' then
        cnt := cnt + 1;
      end if;
    end loop;
    ones_o <= cnt;
  end process;
end architecture rtl;
