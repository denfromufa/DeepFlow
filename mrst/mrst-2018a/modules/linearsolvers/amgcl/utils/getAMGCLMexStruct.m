function amg_opt = getAMGCLMexStruct(varargin)
    amg_opt = struct('preconditioner', 'amg', ...
                     'coarsening',     'aggregation', ...
                     'relaxation',     'spai0', ...
                     's_relaxation',   'ilu0', ...
                     'solver',         'bicgstab', ...
                     'block_size',     0, ...
                     'active_rows',    0, ...
                     'use_drs',        false, ...
                     'drs_eps_ps',     0.02, ...
                     'drs_eps_dd',     0.2, ...
                     'coarse_enough',  -1, ...
                     'direct_coarse',  false, ...
                     'max_levels',     -1, ...
                     'ncycle',         1, ...
                     'npre',           1, ...
                     'npost',          1, ...
                     'pre_cycles',     1, ...
                     'gmres_m',        30, ...
                     'lgmres_k',        3, ...
                     'lgmres_always_reset', true,  ...
                     'lgmres_store_av',  true, ...
                     'idrs_s',          4, ...
                     'idrs_omega',      0.7, ...
                     'idrs_replacement', false, ...
                     'bicgstabl_l',     2, ...
                     'bicgstabl_delta', 0, ...
                     'bicgstabl_convex', true, ...
                     'verbose',         false);
    amg_opt = merge_options(amg_opt, varargin{:});
    % Translate into codes
    amg_opt.preconditioner = translateOptionsAMGCL('preconditioner', amg_opt.preconditioner);
    amg_opt.coarsening = translateOptionsAMGCL('coarsening', amg_opt.coarsening);
    amg_opt.relaxation = translateOptionsAMGCL('relaxation', amg_opt.relaxation);
    amg_opt.s_relaxation = translateOptionsAMGCL('relaxation', amg_opt.s_relaxation);
    amg_opt.solver = translateOptionsAMGCL('solver', amg_opt.solver);

end