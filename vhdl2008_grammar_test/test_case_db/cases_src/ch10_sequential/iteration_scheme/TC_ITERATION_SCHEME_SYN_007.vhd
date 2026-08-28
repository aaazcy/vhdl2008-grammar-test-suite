-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Positive
-- Test Focus: comprehensive example: for loop traversing an array + while loop with exit when — the two iteration_scheme forms used together in the same process, implementing array element scanning and conditional termination
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iter_syn7_ent is port(din:in integer; y:out integer); end entity;
architecture bh of iter_syn7_ent is
  type t_arr is array(0 to 15) of integer;
  signal s_buf : t_arr := (others => 0);
  signal s_ptr : integer range 0 to 15 := 0;
begin
  process(din) is
    variable v_idx : integer := 0;
    variable v_found : boolean := false;
  begin
    for i in 0 to 15 loop
      s_buf(i) <= din * i;
    end loop;
    v_idx := 0; v_found := false;
    while (v_idx < 16) and (not v_found) loop
      if s_buf(v_idx) > 100 then
        v_found := true;
        exit;
      end if;
      v_idx := v_idx + 1;
    end loop;
    s_ptr <= v_idx;
    y <= v_idx;
  end process;
end architecture bh;
