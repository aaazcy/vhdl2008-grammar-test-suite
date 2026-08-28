-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_type_definition ::= unbounded_array_definition | constrained_array_definition
-- Case Type: Positive
-- Test Focus: 2D matrix with mixed directions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_spc2_ent is port(r:out integer); end entity;
architecture bh of arr_spc2_ent is
  type t_mat is array(0 to 3, 7 downto 0) of bit;
  signal s_m : t_mat := (others => (others => '0'));
  signal s_val : integer := 0;
begin
  process
  begin
    for i in s_m'range(1) loop
      for j in s_m'range(2) loop
        s_m(i,j) <= '1' when (i+j) mod 2 = 0 else '0';
      end loop;
    end loop;
    r <= s_val; wait;
  end process;
end architecture bh;
