-- =============================================================
-- Case ID: TC_SEM_ADP_001_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ADP_001
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: Identifiers declared in the architecture declarative part are visible in the statement part - use after declaration is legal semantic behavior
-- Case Type: Positive
-- Error Category: scope_visibility_error
-- Test Focus: Positive case: declarative part defines type (t_data)/subtype (t_byte)/constant (C_OFFSET)/signal (s_val)/function (f_scale), a process in the statement part uses all these declarations via signal assignment and function calls, verifying visibility propagation from declarative part to statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity adp_sem_ent is port(clk:in bit; a:in integer; y:out integer); end entity;
architecture bh of adp_sem_ent is
  type t_data is range -1000 to 1000;
  subtype t_small is t_data range 0 to 255;
  constant C_OFFSET:t_data:=10;
  signal s_raw:t_data:=0;
  function f_scale(x:t_data) return t_data is
  begin return x*2+C_OFFSET; end function;
begin
  process(clk) begin
    if clk'event and clk='1' then s_raw<=f_scale(t_data(a)); end if;
  end process;
  y<=integer(s_raw);
end architecture bh;
