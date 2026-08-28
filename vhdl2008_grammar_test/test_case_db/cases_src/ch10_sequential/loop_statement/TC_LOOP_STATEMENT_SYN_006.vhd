-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Positive
-- Test Focus: For-loop using the 'range and 'reverse_range attributes: for the two signals s_asc and s_desc respectively use `for i in s_data'range` (ascending) and `for i in s_data'reverse_range` (descending) to iterate the same array, verifies complete syntax coverage of range attributes as discrete_range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity loop_range_attr_ent is
  port(clk:in bit; q_asc:out integer; q_desc:out integer);
end entity;
architecture bh of loop_range_attr_ent is
  type t_byte is array(7 downto 0) of integer;
  signal s_data:t_byte:=(0=>1,1=>2,2=>3,3=>4,4=>5,5=>6,6=>7,7=>8);
  signal s_asc_sum:integer:=0;
  signal s_desc_sum:integer:=0;
begin
  process(clk)
    variable v_tmp:integer:=0;
  begin
    if clk'event and clk='1' then
      v_tmp:=0;
      for i in s_data'reverse_range loop
        v_tmp:=v_tmp+s_data(i);
      end loop;
      s_asc_sum<=v_tmp;
      v_tmp:=0;
      for i in s_data'range loop
        v_tmp:=v_tmp+s_data(i);
      end loop;
      s_desc_sum<=v_tmp;
    end if;
  end process;
  q_asc<=s_asc_sum;
  q_desc<=s_desc_sum;
end architecture bh;
