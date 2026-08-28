-- =============================================================
-- Case ID: TC_DIRECTION_SMN_002
-- Related Rule ID: SMN_DIRECTIO_002
-- Rule Type: Semantic (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: Semantic negative: the for-loop range '0.0 to 7.0' applies direction 'to' to real bounds, but a loop parameter range must be discrete; the direction keyword alone cannot make a real range discrete
-- Expected Result: Triggers semantic error: range is not discrete
-- Dependencies: None
-- =============================================================
entity dir_ent is
  port ( dout : out integer );
end entity;
architecture cross_direction of dir_ent is
  type t_vec is array (7 downto 0) of integer;
  signal s_vec : t_vec := (others => 0);
  signal s_sum : integer := 0;
begin
  process
  begin
    for i in 0.0 to 7.0 loop
      s_sum <= s_sum + s_vec(i);
    end loop;
    dout <= s_sum;
    wait;
  end process;
end architecture cross_direction;
