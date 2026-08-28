-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::=
--   protected body
--     protected_type_body_declarative_part
--   end protected body [ protected_type_simple_name ]
-- Test Focus: Minimal protected type body with single procedure,
--   no optional trailing name. Verifies the core 'protected body ...
--   end protected body' structure without optional identifier.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_minimal is
  port (
    clk   : in  bit;
    count : out natural
  );
end entity pt_body_minimal;

architecture rtl of pt_body_minimal is
  type t_counter is protected
    procedure tick;
    impure function value return natural;
  end protected;
  type t_counter is protected body
    variable v_cnt : natural := 0;
    procedure tick is
    begin
      v_cnt := v_cnt + 1;
    end procedure;
    impure function value return natural is
    begin
      return v_cnt;
    end function;
  end protected body;
  shared variable sv_ctr : t_counter;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv_ctr.tick;
      count <= sv_ctr.value;
    end if;
  end process;
end architecture rtl;
